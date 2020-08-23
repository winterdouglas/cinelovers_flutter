import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'api_constants.dart';
import 'genre.dart';

class GenreProvider {
  http.Client _client;

  GenreProvider(http.Client client) {
    _client = client;
  }

  Future<List<Genre>> fetchGenres() async {
    final response = await _client.get(
      '${ApiConstants.apiBaseUrl}/genre/movie/list?api_key=${ApiConstants.apiKey}',
    );

    return compute(parseGenres, response.body);
  }

  List<Genre> parseGenres(String responseBody) {
    final response = json.decode(responseBody).cast<Map<String, dynamic>>();
    return response.map<Genre>((genre) => Genre.fromJson(genre)).toList();
  }
}
