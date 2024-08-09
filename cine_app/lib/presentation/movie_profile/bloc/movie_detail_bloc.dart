import 'package:bloc/bloc.dart';
import 'package:cine_app/infrastructure/datasources/movie_detail_datasource.dart';
import 'package:cine_app/infrastructure/models/movie_details.dart';
import 'package:equatable/equatable.dart';


part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieDetailDatasource movieDetailDatasource;

  MovieDetailBloc(this.movieDetailDatasource) : super(MovieDetailInitial()) {
    on<LoadMovieDetailEvent>((event, emit) async {
      emit(MovieDetailLoading());
      try {
        final movieDetails = await movieDetailDatasource.getMovieDetailsById(event.movieId);
        emit(MovieDetailLoaded(movieDetails));
      } catch (error) {
        emit(MovieDetailError(error.toString()));
      }
    });
  }
}
