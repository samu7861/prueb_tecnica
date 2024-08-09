 part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadMovieDetailEvent extends MovieDetailEvent {
  final String movieId;

  const LoadMovieDetailEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}
