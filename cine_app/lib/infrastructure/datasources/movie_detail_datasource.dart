import 'package:dio/dio.dart';

import 'package:cine_app/infrastructure/models/movie_details.dart';

import '../../config/constants/environment.dart';

class MovieDetailDatasource {

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.keyApi,
      'language': 'es-MX'
    }
  ));

  Future<MovieDetails> getMovieDetailsById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) throw Exception('Movie with id: $id not found');
    
    final movieDetails = MovieDetails.fromJson(response.data);
    return movieDetails;
  }
}
