import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_tracker/movie_card.dart';
import 'package:movies_tracker/services/global_theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AppBar appbar = AppBar();

  @override
  Widget build(BuildContext context) {
    double height = appbar.preferredSize.height;

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
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TabBarView(
            children: [
              GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 250),
                children: [
                  Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                        child: MovieCard(), onTap: () => print("lol"), enableFeedback: true)
                  ),
                  MovieCard(),
                  MovieCard(),
                  MovieCard(),
                  MovieCard(),
                ],
              ),
              GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 250),
                children: [MovieCard(), MovieCard()],
              ),
              GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 250),
                children: [
                  MovieCard(),
                  MovieCard(),
                  MovieCard(),
                ],
              ),
            ],
          ),
        ),
        // Todo: Make the home page
      ),
    );
  }
}
