import 'package:cinelovers/models/genre.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<List<Movie>> fetchMovies() async {
  final response = await http.get(
    'https://jsonplaceholder.typicode.com/albums/1',
    headers: {HttpHeaders.authorizationHeader: "Bearer TOKEN"},
  );
  final responseJson = json.decode(response.body);

  return MoviePage.fromJson(responseJson).results;
}

class MoviePage {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<Movie> results;

  MoviePage(
    this.page,
    this.totalPages,
    this.totalResults,
    this.results,
  );

  factory MoviePage.fromJson(Map<String, dynamic> json) {
    return MoviePage(
      json['page'],
      json['total_pages'],
      json['total_results'],
      json['results'],
    );
  }
}

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final List<Genre> genres;
  final DateTime releaseDate;

  Movie(
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.genres,
    this.releaseDate,
  );

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      json['id'],
      json['title'],
      json['overview'],
      json['poster_path'],
      json['genre_ids'],
      json['release_date'],
    );
  }
}
