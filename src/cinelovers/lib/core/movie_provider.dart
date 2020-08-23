import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'api_constants.dart';
import 'movie_page.dart';

class MovieProvider {
  http.Client _client;

  MovieProvider(http.Client client) {
    _client = client;
  }

  Future<MoviePage> fetchUpcomingMovies(int page) async {
    final response = await _client.get(
      '${ApiConstants.apiBaseUrl}/movie/upcoming?page=$page&api_key=${ApiConstants.apiKey}',
    );

    return compute(_parseMovies, response.body);
  }

  static MoviePage _parseMovies(String responseBody) {
    final responseJson = json.decode(responseBody);
    return MoviePage.fromJson(responseJson);
  }
}
