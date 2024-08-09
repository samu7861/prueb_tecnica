import 'package:flutter/material.dart';
import '../../domain/entities/movie.dart';

class MovieProfileScreen extends StatelessWidget {
  final Movie movie;

  const MovieProfileScreen({Key? key, required this.movie}) : super(key: key);

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
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInImage.assetNetwork(
              placeholder: 'assets/placeholder.png', // Asegúrate de tener esta imagen en tus assets
              image: movie.posterPath,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
              imageErrorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Icon(Icons.error, color: Colors.red),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      // Acción para ver la película
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[700]),
                    child: const Text('WATCH NOW'),
                  ),
                  const SizedBox(height: 8.0),
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
                  const SizedBox(height: 16.0),
                  Text(
                    movie.overview,
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Cast',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8.0),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Añade aquí los actores de la película con URLs reales
                        _buildActorAvatar('Amy Poehler', 'https://example.com/amy.jpg'),
                        _buildActorAvatar('Maya Hawke', 'https://example.com/maya.jpg'),
                        _buildActorAvatar('Kensington', 'https://example.com/kensington.jpg'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Studio',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '${movie.genreIds}',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Genre',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '${movie.genreIds}',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Release',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '${movie.releaseDate}',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActorAvatar(String name, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          FadeInImage.assetNetwork(
            placeholder: 'assets/placeholder.png', // Asegúrate de tener esta imagen en tus assets
            image: imageUrl,
            imageErrorBuilder: (context, error, stackTrace) {
              return CircleAvatar(
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
