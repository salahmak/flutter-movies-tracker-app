import 'package:flutter/material.dart';
import 'package:movies_tracker/services/movie.dart';
import 'movie_card.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({super.key, required this.movies});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return movies.length == 0
        ? Center(child: Text("No movies to show"))
        : GridView.builder(
            itemCount: movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                // TODO: Add settings to change these params
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent: 250),
            itemBuilder: (context, index) {
              print("home");
              return MovieCard(movie: movies[index]);
            },
          );
  }
}
