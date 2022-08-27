import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_tracker/providers/movies_provider.dart';
import 'package:movies_tracker/services/movie.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';
import 'services/global_theme.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieAdapter());
  await Hive.openBox<Movie>("movies");

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => Movies())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {"/": (ctx) => const Home()},
      theme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: colorScheme,
          textTheme: TextTheme(bodyMedium: TextStyle(color: colorScheme.onSurface)),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: colorScheme.onBackground)),
          scaffoldBackgroundColor: colorScheme.background,
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: colorScheme.primary,
              width: 2,
            ),
          )),
          drawerTheme: DrawerThemeData(backgroundColor: colorScheme.surface)),
    );
  }
}
