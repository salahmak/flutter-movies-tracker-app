import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movies_tracker/services/movie.dart';

class Movies with ChangeNotifier {
  final List<Movie> _movies = Hive.box<Movie>("movies").values.toList();

  List<Movie> get movies => _movies;

  var moviesBox = Hive.box<Movie>("movies");

  /// Adds [movie] to the [_movies] array and to the [moviesBox] hove box
  void add(Movie movie) async {
    if (!_movies.contains(movie)) {
      movie.markAsUnseen();
      movies.add(movie);
      await moviesBox.put(movie.id, movie);
      print(moviesBox.values.toList());
      notifyListeners();
    }
  }

  /// Removes [movie] from the [_movies] array and to the [moviesBox] hive box
  void remove(Movie movie) {
    if (_movies.contains(movie)) {
      _movies.remove(movie);
      movie.markAsUnseen();
      moviesBox.delete(movie.id);
      notifyListeners();
    }
  }

  /// When [movie] exists inside [_movies], it marks its object as seen and then updates its corresponding object in [moviesBox]
  ///
  /// When [movie] isn't in [_movies], it adds to the array as well as to the [moviesBox] hive box
  void markAsSeen(Movie movie) {
    if (_movies.contains(movie)) {
      Movie originalMovie = _movies.elementAt(_movies.indexOf(movie));
      originalMovie.markAsSeen();
      moviesBox.put(originalMovie.id, originalMovie);
    } else {
      movie.markAsSeen();
      add(movie);
      moviesBox.put(movie.id, movie);
    }
    notifyListeners();
  }

  /// Marks [movie] as seen by updating its object's status attribute, then updates its object in [moviesBox] hive box
  void markAsUnseen(Movie movie) {
    if (_movies.contains(movie)) {
      Movie originalMovie = _movies.elementAt(_movies.indexOf(movie));
      originalMovie.markAsUnseen();
      moviesBox.put(movie.id, originalMovie);
      notifyListeners();
    }
  }

  List<Movie> getPending() {
    return movies.where((m) => m.status == "pending").toList();
  }

  List<Movie> getSeen() {
    return movies.where((m) => m.status == "seen").toList();
  }
}
