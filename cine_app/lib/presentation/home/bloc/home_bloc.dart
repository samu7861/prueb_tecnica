import 'package:bloc/bloc.dart';
import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/presentation/home/bloc/home_event.dart';
import 'package:cine_app/presentation/home/bloc/home_state.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/datasources/movies_datasoruce.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MoviesDatasoruce moviesDatasoruce;

  HomeBloc({required this.moviesDatasoruce}) : super(HomeInitial()) {
    on<LoadMovies>(_onLoadMovies);
  }

  Future<void> _onLoadMovies(LoadMovies event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final nowPlayingMovies = await moviesDatasoruce.getNowPlaying();
      final popularMovies = await moviesDatasoruce.getPopular();
      emit(HomeMoviesLoaded(nowPlayingMovies: nowPlayingMovies, popularMovies: popularMovies));
    } catch (error) {
      emit(HomeError(message: error.toString()));
    }
  }
}
