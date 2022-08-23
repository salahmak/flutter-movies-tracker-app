import 'package:flutter/material.dart';
import 'package:movies_tracker/services/global_theme.dart';
import 'package:movies_tracker/services/movie.dart';

class MovieCard extends StatelessWidget {

  Movie? movie;

  MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("movie card lol");
    return Stack(
      children: [
        Positioned.fill(
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GridTile(
              footer: GridTileBar(
                title: Text(movie?.Title ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16)),
                backgroundColor: Color(0xd91e1b26),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    movie?.Poster ?? '',
                    fit: BoxFit.fitWidth,
                  )),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {},
            ),
          ),
        )
      ],
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:movies_tracker/services/global_theme.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: AssetImage("assets/in.jpg"), fit: BoxFit.fitWidth)),
          width: (MediaQuery.of(context).size.width / 2) - 10,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text("Interstellar",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

*/
