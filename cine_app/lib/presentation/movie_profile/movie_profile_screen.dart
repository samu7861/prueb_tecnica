import 'package:cine_app/presentation/movie_profile/bloc/movie_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailScreen extends StatelessWidget {
  final String movieId;

  const MovieDetailScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.colorScheme.secondary;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: const [
          Icon(Icons.favorite_border_outlined, color: Colors.white),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieDetailLoaded) {
            final movieDetails = state.movieDetails;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInImage.assetNetwork(
                    placeholder: 'assets/placeholder.png',
                    image:
                        'https://image.tmdb.org/t/p/w500${movieDetails.backdropPath}',
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey,
                        child: const Icon(Icons.error, color: Colors.red),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movieDetails.title,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Para separar el botón y las estrellas
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Acción para ver la película
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[700]),
                              child: const Text('WATCH NOW'),
                            ),
                            Row(
                              children: List.generate(
                                5,
                                (starIndex) => Icon(
                                  starIndex <
                                          (movieDetails.voteAverage / 2).floor()
                                      ? Icons.star
                                      : Icons.star_border,
                                  size: 16,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          movieDetails.overview,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Cast',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 8.0),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children:
                                movieDetails.productionCompanies.map((company) {
                              return _buildActorAvatar(company.name,
                                  'https://image.tmdb.org/t/p/w500${company.logoPath ?? ''}');
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Studio',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          movieDetails.productionCompanies
                              .map((e) => e.name)
                              .join(', '),
                          style: const TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Genre',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          movieDetails.genres.map((e) => e.name).join(', '),
                          style: const TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Release',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '${movieDetails.releaseDate.toLocal()}'.split(' ')[0],
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is MovieDetailError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  Widget _buildActorAvatar(String name, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          FadeInImage.assetNetwork(
            placeholder: 'assets/placeholder.png',
            image: imageUrl,
            imageErrorBuilder: (context, error, stackTrace) {
              return const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
                child: Icon(Icons.error, color: Colors.red),
              );
            },
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 4.0),
          Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
