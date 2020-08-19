import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

Future<List<Movie>> fetchMovies(http.Client client) async {
  final response = await client.get(
    'https://api.themoviedb.org/3/movie/upcoming?page=1&language=en-US&api_key=',
  );

  return compute(parseMovies, response.body);
}

List<Movie> parseMovies(String responseBody) {
  final responseJson = json.decode(responseBody);
  return MoviePage.fromJson(responseJson).results;
}

class MoviePage {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<Movie> results;

  MoviePage({
    this.page,
    this.totalPages,
    this.totalResults,
    this.results,
  });

  factory MoviePage.fromJson(Map<String, dynamic> json) {
    return MoviePage(
      page: json['page'] as int,
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
      results: List<Map>.from(json['results'])
          .map((model) => Movie.fromJson(model))
          .toList(),
    );
  }
}

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final List<int> genres;
  final String releaseDate;

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
      List<dynamic>.from(json['genre_ids'])
          .map((model) => model as int)
          .toList(),
      json['release_date'],
    );
  }
}
