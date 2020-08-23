import 'movie.dart';

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
      results: json['results']
          .cast<Map<String, dynamic>>()
          .map<Movie>((model) => Movie.fromJson(model))
          .toList(),
    );
  }
}
