import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart';

part 'movie.g.dart';

@HiveType(typeId: 1, adapterName: "MovieAdapter")
class Movie {
  @HiveField(0)
  String status = "pending"; // "pending", "seen", "none", is the movie's watching status

  //Movie info that will be fetched from the API
  @HiveField(1)
  late String id;

  @HiveField(2)
  late String title;

  @HiveField(3)
  late String type; // Movie, Show...

  @HiveField(4)
  late String year;

  @HiveField(5)
  late String poster;

  @HiveField(6)
  late String? rated;

  @HiveField(7)
  late String? runtime;

  @HiveField(8)
  late String? genre;

  @HiveField(9)
  late String? actors;

  @HiveField(10)
  late String? plot;

  @HiveField(11)
  late String? imdbRating;

  Movie(
      {required this.id,
      required this.title,
      required this.type,
      required this.year,
      required this.poster,
      required this.status,
      this.rated,
      this.runtime,
      this.genre,
      this.actors,
      this.plot,
      this.imdbRating});

  void markAsSeen() {
    status = "seen";
  }

  void markAsUnseen() {
    status = "pending";
  }

  Future<void> fetch() async {
    // we fetch the rest of the data in case if they are all null
    // they should be null if we first construct a Movie obj from ?s api call to omdb since it doesn't give these info
    if (rated == null &&
        runtime == null &&
        genre == null &&
        actors == null &&
        plot == null &&
        imdbRating == null) {
      Response res = await get(Uri.parse("http://www.omdbapi.com/?apikey=e975f21e&i=${id}"));
      Map data = jsonDecode(res.body);

      rated = data["Rated"];
      runtime = data["Runtime"];
      genre = data["Genre"];
      actors = data["Actors"];
      plot = data["Plot"];
      imdbRating = data["imdbRating"];
    }
  }
}
