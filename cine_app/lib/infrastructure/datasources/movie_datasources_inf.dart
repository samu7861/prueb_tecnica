import 'package:cine_app/config/constants/environment.dart';
import 'package:cine_app/domain/datasources/movies_datasoruce.dart';
import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/infrastructure/mappers/movie_mapper.dart';
import 'package:cine_app/infrastructure/models/moviedb_response.dart';
import "package:dio/dio.dart";

class MovieDatasourcesInf extends MoviesDatasoruce{

  final dio = Dio(BaseOptions(
    baseUrl: "https://api.themoviedb.org/3",
    queryParameters: {
      "api_key": Environment.keyApi,
      "lenguage": "es-MX"
    },
    ));
 
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{

    final response = await dio.get("/movie/now_playing");

    final movieResponse = MovieResponse.fromJson(response.data);
    
    final List<Movie> movies = movieResponse.results
    .where((moviedb) => moviedb.posterPath != "no-poster")
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movies;

  }

}

