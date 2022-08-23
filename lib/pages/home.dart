import 'package:flutter/material.dart';
import 'package:movies_tracker/movie_card.dart';
import 'package:movies_tracker/services/global_theme.dart';
import 'package:movies_tracker/services/movie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  List<Movie> movies = [
    Movie(
        "jkdsjfdsf",
        "Interstellar",
        "Drama",
        "2013",
        "9",
        "2h",
        "Drama",
        "jane lmao",
        "dlmazldamzdlamzdlamzldzalda",
        "https://cdn.discordapp.com/attachments/975876776318361681/1008146129910759434/in.jpg",
        "39",
        "watched"),
    Movie(
        "jkdsjfdsf",
        "lmao",
        "Drama",
        "2011",
        "9",
        "2h",
        "Drama",
        "jane lmao",
        "dlmazldamzdlamzdlamzldzalda",
        "https://cdn.discordapp.com/attachments/975876776318361681/1008146129910759434/in.jpg",
        "39",
        "pending"),
    Movie(
        "jkdsjfdsf",
        "LOL",
        "Drama",
        "2009",
        "9",
        "2h",
        "Drama",
        "jane lmao",
        "dlmazldamzdlamzdlamzldzalda",
        "https://cdn.discordapp.com/attachments/975876776318361681/1008146129910759434/in.jpg",
        "39",
        "pending"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          icon: Icon(Icons.home),
                          style: ButtonStyle(alignment: Alignment.centerLeft),
                          onPressed: () {},
                          label: Text("Library"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          icon: Icon(Icons.add),
                          style: ButtonStyle(alignment: Alignment.centerLeft),
                          onPressed: () {},
                          label: Text("Discover"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          icon: Icon(Icons.settings),
                          style: ButtonStyle(alignment: Alignment.centerLeft),
                          onPressed: () {},
                          label: Text("Settings"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          icon: Icon(Icons.ad_units),
                          style: ButtonStyle(alignment: Alignment.centerLeft),
                          onPressed: () {},
                          label: Text("About"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: colorScheme.primary,
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Watching",
              ),
              Tab(
                text: "Watched",
              ),
            ],
          ),
          title: Text("Home"),
          centerTitle: true,
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: movies.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // TODO: Add settings to change these params
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 250),
                itemBuilder: (context, index) {
                  print("home");
                  return MovieCard(movie: movies[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: movies.where((m) => m.status == "pending").length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8, mainAxisExtent: 250),
                itemBuilder: (context, index) {
                  //filtering the movies to only have ones with pending status
                  List<Movie?> filteredMovies = movies.where((m) => m.status == "pending").toList();

                  return MovieCard(movie: filteredMovies[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: movies.where((m) => m.status == "watched").length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8, mainAxisExtent: 250),
                itemBuilder: (context, index) {
                  //filtering the movies to only have ones with pending status
                  List<Movie?> filteredMovies = movies.where((m) => m.status == "watched").toList();

                  return MovieCard(movie: filteredMovies[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
