import 'package:cine_app/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeMoviesLoaded extends HomeState {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;

  const HomeMoviesLoaded({
    required this.nowPlayingMovies,
    required this.popularMovies,
  });

  @override
  List<Object> get props => [nowPlayingMovies, popularMovies];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
