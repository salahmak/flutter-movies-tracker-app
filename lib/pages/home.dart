import 'package:flutter/material.dart';
import 'package:movies_tracker/MoviesGridView.dart';
import 'package:movies_tracker/pages/search_page.dart';
import 'package:movies_tracker/services/global_theme.dart';
import 'package:movies_tracker/services/movie.dart';
import 'package:provider/provider.dart';
import 'package:movies_tracker/providers/movies_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<Movie> movies = [];


  void addToList(Movie movie) {
    context.read<Movies>().add(movie);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Initializing the provider [_movies] with the values from the hive storage

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                },
                icon: Icon(Icons.search))
          ],
          bottom: TabBar(
            indicatorColor: colorScheme.primary,
            tabs: const [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Pending",
              ),
              Tab(
                text: "Seen",
              ),
            ],
          ),
          title: const Text("Home"),
          centerTitle: true,
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MoviesGridView(movies: context.watch<Movies>().movies),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MoviesGridView(movies: context.watch<Movies>().getPending()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MoviesGridView(movies: context.watch<Movies>().getSeen()),
            ),
          ],
        ),
      ),
    );
  }
}
