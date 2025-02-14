class MovieVideoApiResponse {
  final int? id;
  final List<MovieVideo>? results;

  MovieVideoApiResponse({this.id, this.results});

  factory MovieVideoApiResponse.fromJson(Map<String, dynamic> json) {
    return MovieVideoApiResponse(
      id: json['id'],
      results: (json['results'] as List?)
          ?.map((e) => MovieVideo.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'results': results?.map((e) => e.toJson()).toList(),
    };
  }
}

class MovieVideo {
  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final String? publishedAt;
  final String? id;

  MovieVideo({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory MovieVideo.fromJson(Map<String, dynamic> json) {
    return MovieVideo(
      iso6391: json['iso_639_1'],
      iso31661: json['iso_316_1'],
      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
      official: json['official'],
      publishedAt: json['published_at'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iso_639_1': iso6391,
      'iso_316_1': iso31661,
      'name': name,
      'key': key,
      'site': site,
      'size': size,
      'type': type,
      'official': official,
      'published_at': publishedAt,
      'id': id,
    };
  }
}
