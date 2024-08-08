import 'package:cine_app/domain/datasources/movies_datasoruce.dart';
import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/domain/repositories/movies_repository.dart';

class MovieRepositoryInf extends MoviesRepository {

  final MoviesDatasoruce datasource;

  MovieRepositoryInf({required this.datasource});


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
 
    return datasource.getNowPlaying(page: page);

  }



}