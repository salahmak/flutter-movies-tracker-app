import 'package:flutter/material.dart';
import 'package:movies_tracker/pages/movie_page.dart';
import 'pages/home.dart';
import 'services/global_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (ctx) => Home(),
        "/movie": (ctx) => MoviePage(imageUrl: "in.jpg", title: "Interstellar", appBarHeight: 56)
      },
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: colorScheme,
        textTheme: TextTheme(bodyMedium: TextStyle(color: colorScheme.onSurface)),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: colorScheme.primary,
            width: 2,
          ),
        )),
      ),
    );
  }
}
