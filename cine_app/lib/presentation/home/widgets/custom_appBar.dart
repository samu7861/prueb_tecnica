
import 'package:flutter/material.dart';
import 'package:cine_app/main.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(16.0),
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode
                  ? Icons.wb_sunny_outlined
                  : Icons.dark_mode_outlined,
              color: themeProvider.isDarkMode ? Colors.yellow : Colors.blue,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Hello, what do you want to watch?',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, color: Colors.white),
              hintText: 'Search',
              hintStyle: const TextStyle(
                  color: Colors
                      .white54), 
              filled: true,
              fillColor: Colors.white
                  .withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    16.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0), 
            ),
            style: const TextStyle(
                color: Colors.white), 
          ),
        ],
      ),
    );
  }
}
