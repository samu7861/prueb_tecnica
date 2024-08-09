
import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/infrastructure/datasources/movie_detail_datasource.dart';
import 'package:cine_app/presentation/movie_profile/bloc/movie_detail_bloc.dart';
import 'package:cine_app/presentation/movie_profile/movie_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MovieHorizontalList extends StatelessWidget {
  final List<Movie> movies;

  const MovieHorizontalList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) {
      return BlocProvider(
        create: (context) => MovieDetailBloc(
          context.read<MovieDetailDatasource>(),
        )..add(LoadMovieDetailEvent(movie.id.toString())),
        child: MovieDetailScreen(movieId: movie.id.toString()),
      );
    },
  ),
);

            },
            child: Container(
              width: 140, // Adjust width as needed
              margin: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        movie.posterPath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    movie.title,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: List.generate(
                      5,
                      (starIndex) => Icon(
                        starIndex < (movie.voteAverage / 2).floor()
                            ? Icons.star
                            : Icons.star_border,
                        size: 16,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
