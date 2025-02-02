import 'package:bloc/bloc.dart';
import 'package:cine_app/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/datasources/movies_datasoruce.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MoviesDatasource moviesDatasoruce;

  HomeBloc({required this.moviesDatasoruce}) : super(HomeInitial()) {
    on<GetNowPlayingMovies>(_onGetNowPlayingMovies);
    on<GetPopularMovies>(_onGetPopularMovies);
  }

  Future<void> _onGetNowPlayingMovies(GetNowPlayingMovies event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final movies = await moviesDatasoruce.getNowPlaying();
      emit(HomeLoaded(movies: movies));
    } catch (error) {
      emit(HomeError(message: error.toString()));
    }
  }

  Future<void> _onGetPopularMovies(GetPopularMovies event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final movies = await moviesDatasoruce.getPopular();
      emit(HomeLoaded(movies: movies));
    } catch (error) {
      emit(HomeError(message: error.toString()));
    }
  }
}
