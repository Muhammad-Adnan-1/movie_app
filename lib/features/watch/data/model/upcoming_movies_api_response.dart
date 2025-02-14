class UpcomingMoviesApiResponse {
  final Dates? dates;
  final int? page;
  final int? totalPages;
  final int? totalResults;
  final List<MovieModel>? results;

  UpcomingMoviesApiResponse({this.dates, this.page, this.results, this.totalPages, this.totalResults});

  factory UpcomingMoviesApiResponse.fromJson(Map<String, dynamic> json) {
    return UpcomingMoviesApiResponse(
      dates: json['dates'] != null ? Dates.fromJson(json['dates']) : null,
      page: int.parse(json['page']?.toString() ?? "0"),
      totalPages: int.parse(json['total_pages']?.toString() ?? "0"),
      totalResults: int.parse(json['total_results']?.toString() ?? "0"),
      results: (json['results'] as List?)?.map((e) => MovieModel.fromJson(e)).toList(),
    );
  }
}

class Dates {
  final String? maximum;
  final String? minimum;

  Dates({this.maximum, this.minimum});

  factory Dates.fromJson(Map<String, dynamic> json) {
    return Dates(
      maximum: json['maximum'],
      minimum: json['minimum'],
    );
  }
}

class MovieModel {
  final bool? adult;
  final String? backdropPath;
  final dynamic belongsToCollection;
  final String? budget;
  final List<Genre>? genres;
  final String? homepage;
  final String? id;
  final String? imdbId;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? popularity;
  final String? posterPath;
  final List<ProductionCompany>? productionCompanies;
  final List<ProductionCountry>? productionCountries;
  final String? releaseDate;
  final String? revenue;
  final String? runtime;
  final List<SpokenLanguage>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final String? voteCount;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'],
      budget: json['budget']?.toString(),
      genres: (json['genres'] as List?)?.map((e) => Genre.fromJson(e)).toList(),
      homepage: json['homepage']?.toString(),
      id: json['id']?.toString(),
      imdbId: json['imdb_id']?.toString(),
      originCountry: (json['origin_country'] as List?)?.map((e) => e as String).toList(),
      originalLanguage: json['original_language']?.toString(),
      originalTitle: json['original_title']?.toString(),
      overview: json['overview']?.toString(),
      popularity: json['popularity']?.toString(),
      posterPath: json['poster_path']?.toString(),
      productionCompanies: (json['production_companies'] as List?)
          ?.map((e) => ProductionCompany.fromJson(e))
          .toList(),
      productionCountries: (json['production_countries'] as List?)
          ?.map((e) => ProductionCountry.fromJson(e))
          .toList(),
      releaseDate: json['release_date']?.toString(),
      revenue: json['revenue']?.toString(),
      runtime: json['runtime']?.toString(),
      spokenLanguages: (json['spoken_languages'] as List?)
          ?.map((e) => SpokenLanguage.fromJson(e))
          .toList(),
      status: json['status']?.toString(),
      tagline: json['tagline']?.toString(),
      title: json['title']?.toString(),
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count']?.toString(),
    );
  }
}

class Genre {
  final String? id;
  final String? name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id']?.toString(),
      name: json['name'],
    );
  }
}

class ProductionCompany {
  final String? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  ProductionCompany({this.id, this.logoPath, this.name, this.originCountry});

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id']?.toString(),
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }
}

class ProductionCountry {
  final String? iso31661;
  final String? name;

  ProductionCountry({this.iso31661, this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: json['iso_3166_1'],
      name: json['name'],
    );
  }
}

class SpokenLanguage {
  final String? englishName;
  final String? iso6391;
  final String? name;

  SpokenLanguage({this.englishName, this.iso6391, this.name});

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      englishName: json['english_name'],
      iso6391: json['iso_639_1'],
      name: json['name'],
    );
  }
}


