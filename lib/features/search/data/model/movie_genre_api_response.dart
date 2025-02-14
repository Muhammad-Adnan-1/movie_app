class MovieGenreApiResponse {
  final List<Genre>? genres;

  MovieGenreApiResponse({this.genres});

  factory MovieGenreApiResponse.fromJson(Map<String, dynamic> json) {
    return MovieGenreApiResponse(
      genres: (json['genres'] as List?)?.map((e) => Genre.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'genres': genres?.map((e) => e.toJson()).toList(),
    };
  }
}

class Genre {
  final int? id;
  final String? name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}