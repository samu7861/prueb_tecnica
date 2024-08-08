import 'package:cine_app/main.dart';
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
        ..add(GetNowPlayingMovies()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(themeProvider: themeProvider),
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HomeLoaded) {
                  return MovieHorizontalList(movies: state.movies);
                } else if (state is HomeError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text('No data available.'));
              },
            ),
          ),
        ],
      ),
    );
  }
}