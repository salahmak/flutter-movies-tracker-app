import 'package:flutter/material.dart';
import 'package:movies_tracker/services/global_theme.dart';

class MoviePage extends StatelessWidget {
  late String imageUrl;
  late String title;
  late double appBarHeight;


  Map data = {};

  MoviePage({required this.imageUrl, required this.title, required this.appBarHeight});

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;



    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          decoration: BoxDecoration(color: colorScheme.surface),
          height: MediaQuery.of(context).size.height - appBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: Image(image: AssetImage(imageUrl), fit: BoxFit.fitWidth),
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
                                  Text(
                                    title,
                                    style: TextStyle(fontSize: 30),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "PG-13/ 2h 49min/ Adventure, Drama, Sci-Fi",
                                    style: TextStyle(fontSize: 16, color: darken(colorScheme.onSurface, .4)),
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
                                      "Lorem ipsum "
                                          "dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut laboro consequat. Duis aute irure dolor in reprehenderit ",
                                      style: TextStyle(color: darken(colorScheme.onSurface, 0.4)),
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
                                    "Maathew, Anne idklol, Jessica lmao",
                                    style: TextStyle(color: darken(colorScheme.onSurface, 0.3)),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          label: Text("Add to list"),
                          icon: Icon(Icons.add),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.save, color: colorScheme.primary,)),
                            IconButton(onPressed: (){}, icon: Icon(Icons.label, color: colorScheme.primary,)),
                            IconButton(onPressed: (){}, icon: Icon(Icons.share, color: colorScheme.primary,)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
