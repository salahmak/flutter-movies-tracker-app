import 'package:flutter/material.dart';
import 'package:movies_tracker/providers/movies_provider.dart';
import 'package:movies_tracker/services/global_theme.dart';
import 'package:movies_tracker/services/movie.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatelessWidget {
  MoviePage({super.key, required this.movie});

  Movie movie;

  Future<bool> setupMovie() async {
    await movie.fetch();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: setupMovie(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Row(
                  children: [
                    Expanded(
                      child: Text(movie.title, maxLines: 1),
                    ),
                  ],
                ),
              ),
              body: Container(
                decoration: BoxDecoration(color: colorScheme.surface),
                height: MediaQuery.of(context).size.height - 56,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                        child: Image.network(
                          movie.poster,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(child: Text("Image not found"));
                          },
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            movie.title,
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${movie.rated} / ${movie.runtime} / ${movie.genre}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: darken(colorScheme.onSurface, .4)),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text(
                                          "SUMMARY",
                                          style: TextStyle(fontSize: 16),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            movie.plot ?? "",
                                            style: TextStyle(
                                                color: darken(colorScheme.onSurface, 0.4)),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          movie.actors ?? "",
                                          style:
                                              TextStyle(color: darken(colorScheme.onSurface, 0.3)),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: AddButton(movie: movie)),
                            SizedBox(width: 20),
                            Container(child: SeenButton(movie: movie))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            width: 0,
          );
        }
      },
    );
  }
}

class AddButton extends StatelessWidget {
  AddButton({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  late bool isAdded;

  @override
  Widget build(BuildContext context) {
    isAdded = context.watch<Movies>().movies.contains(movie);

    return ElevatedButton(
        onPressed: () {
          isAdded ? context.read<Movies>().remove(movie) : context.read<Movies>().add(movie);
        },
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            backgroundColor: isAdded ? colorScheme.primary : Colors.transparent,
            foregroundColor: isAdded ? colorScheme.onPrimary : colorScheme.primary,
            elevation: 0,
            side: BorderSide(color: colorScheme.primary, width: 2)),
        child: Icon(isAdded ? Icons.delete : Icons.add));
  }
}

class SeenButton extends StatelessWidget {
  SeenButton({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  late bool isSeen;

  @override
  Widget build(BuildContext context) {
    isSeen = context.watch<Movies>().getSeen().contains(movie);

    return ElevatedButton(
        onPressed: () {
          isSeen
              ? context.read<Movies>().markAsUnseen(movie)
              : context.read<Movies>().markAsSeen(movie);
        },
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            backgroundColor: isSeen ? colorScheme.primary : Colors.transparent,
            foregroundColor: isSeen ? colorScheme.onPrimary : colorScheme.primary,
            elevation: 0,
            side: BorderSide(color: colorScheme.primary, width: 2)),
        child: Icon(isSeen ? Icons.visibility_off : Icons.visibility));
  }
}
