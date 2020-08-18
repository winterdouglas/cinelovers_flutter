import 'package:flutter/material.dart';
import 'upcoming_movies.dart';

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
      home: UpcomingMoviesPage(title: 'Upcoming movies'),
    );
  }
}
