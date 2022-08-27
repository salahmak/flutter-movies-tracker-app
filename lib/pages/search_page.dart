import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movies_tracker/MoviesGridView.dart';
import 'package:movies_tracker/services/movie.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  _SearchPageState();

  final searchController = TextEditingController();
  bool isLoading = false;
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(() => setState(() {}));
  }

  void fetchMovies(String query) async {
    setState(() {
      isLoading = true;
    });

    List<Movie> tempMovies = [];

    Response res = await get(Uri.parse("http://www.omdbapi.com/?apikey=e975f21e&s=${query}"));
    Map data = jsonDecode(res.body);

    List<dynamic> mvs = data["Search"];

    for (var movie in mvs) {
      tempMovies.add(Movie(
          id: movie["imdbID"],
          title: movie["Title"],
          type: movie["Type"],
          year: movie["Year"],
          poster: movie["Poster"],
          status: "none"));
    }

    setState(() {
      movies = tempMovies;
      isLoading = false;
    });
  }

  void onSearchSubmit(String val) {
    fetchMovies(val);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SearchInputContainer(
            searchController: searchController, onSubmit: (val) => onSearchSubmit(val)),
      ),
      body: Container(
        child:
            isLoading ? Center(child: CircularProgressIndicator()) : MoviesGridView(movies: movies),
      ),
    );
  }
}

class SearchInputContainer extends StatelessWidget {
  const SearchInputContainer({super.key, required this.searchController, required this.onSubmit});

  final ValueSetter<String> onSubmit;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextField(
          autofocus: true,
          onSubmitted: (value) {
            onSubmit(value);
          },
          controller: searchController,
          decoration: InputDecoration(
              hintText: "Search...",
              suffixIcon: searchController.text.isEmpty
                  ? Container(width: 0)
                  : IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        searchController.clear();
                      },
                    ),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
