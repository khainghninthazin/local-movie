import 'dart:convert';

class popularmovies {
  final int id;

  final String overview;

  final String? poster_path;

  final String title;

  final int voteCount;

  popularmovies({
    required this.id,
    required this.overview,
    this.poster_path,
    required this.title,
    required this.voteCount,
  });

  // Factory method to create an object from a JSON map
  factory popularmovies.fromJson(Map<String, dynamic> json) {
    return popularmovies(
      id: json['id'],
      overview: json['overview'],
      poster_path: json['poster_path'],
      title: json['title'],
      voteCount: json['vote_count'],
    );
  }

  get posterPath => null;

  // Method to convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'overview': overview,
      'poster_path': poster_path,
      'title': title,
      'vote_count': voteCount,
    };
  }

  // Helper method to convert JSON string to object
  static popularmovies fromJsonString(String jsonString) {
    return popularmovies.fromJson(json.decode(jsonString));
  }

  // Helper method to convert object to JSON string
  String toJsonString() {
    return json.encode(toJson());
  }
}
