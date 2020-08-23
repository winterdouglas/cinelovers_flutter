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
