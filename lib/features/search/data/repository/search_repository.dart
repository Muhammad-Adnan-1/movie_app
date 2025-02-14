import 'package:movies_app/core/services/api_interface.dart';
import 'package:movies_app/features/search/data/model/movie_genre_api_response.dart';
import 'package:movies_app/features/watch/data/model/upcoming_movies_api_response.dart';

class SearchRepository {
  final ApiInterface _apiInterface;
  SearchRepository(ApiInterface apiInterface): _apiInterface = apiInterface;

  Future<UpcomingMoviesApiResponse> searchMovies(String query, int page) async {
    return await _apiInterface.searchMovies(query, page);
  }

  Future<MovieGenreApiResponse> moviesGenreList() async {
    return await _apiInterface.movieGenreList();
  }

}
