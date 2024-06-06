import 'package:fllute_movie_films/pages/movie_list/movie_list_page.dart';
import 'package:fllute_movie_films/services_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ('Movie App'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:Color.fromARGB(255, 0, 0, 0),
        colorScheme: const ColorScheme.dark(
          primary: Color.fromARGB(212, 176, 5, 219),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(11, 64, 90, 0),
        ),
        useMaterial3: true,
      ),
      home: const MovieListPage(),
    );
  }
}
