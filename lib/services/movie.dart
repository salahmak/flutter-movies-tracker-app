class Movie {

  String status = "pending"; // "pending" or "watched", is the movie's watching status

  //Movie info that will be fetched from the API
  late String id;
  late String Title;
  late String Type; // Movie, Show...
  late String Year;
  late String Rated;
  late String Runtime;
  late String Genre;
  late String Actors;
  late String Plot;
  late String Poster;
  late String imdbRating;

  Movie(this.id, this.Title, this.Type, this.Year, this.Rated, this.Runtime, this.Genre,
      this.Actors, this.Plot, this.Poster, this.imdbRating, this.status);
}
