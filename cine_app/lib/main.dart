import 'package:flutter/material.dart';

import 'config/router/app_router.dart';
import 'config/theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  //TODO: final appTheme (darkmode)

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}  