import 'package:flutter/material.dart';
import 'screens/movies/components/upcoming_movies_screen.dart';

class CineloversApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinelovers',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade300,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UpcomingMoviesScreen(title: 'Upcoming movies'),
    );
  }
}
