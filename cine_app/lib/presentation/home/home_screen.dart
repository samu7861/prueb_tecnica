import 'package:cine_app/main.dart';
import 'package:cine_app/presentation/home/bloc/home_event.dart';
import 'package:cine_app/presentation/home/bloc/home_state.dart';
import 'package:cine_app/presentation/home/widgets/custom_appBar.dart';
import 'package:cine_app/presentation/home/widgets/movie_sliders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/movie.dart';
import 'bloc/home_bloc.dart';
import 'package:cine_app/infrastructure/datasources/movie_datasources_inf.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(moviesDatasoruce: MovieDatasourcesInf())
        ..add(LoadMovies()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.colorScheme.secondary;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(themeProvider: themeProvider),
            Container(
              color: backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "RECOMMENDED FOR YOU",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is HomeMoviesLoaded) {
                        return Column(
                          children: [
                            MovieHorizontalList(movies: state.nowPlayingMovies),
                            SizedBox(height: 20),
                            MovieHorizontalList(movies: state.popularMovies),
                          ],
                        );
                      } else if (state is HomeError) {
                        return Center(child: Text(state.message));
                      }
                      return const Center(child: Text('No data available.'));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
