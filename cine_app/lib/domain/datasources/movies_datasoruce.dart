import 'package:cine_app/domain/entities/movie.dart';

abstract class MoviesDatasoruce {

  Future<List<Movie>> getNowPlaying({ int page = 1});

}