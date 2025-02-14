import 'package:movies_app/core/services/api_interface.dart';
import 'package:movies_app/features/watch/data/model/upcoming_movies_api_response.dart';

class MovieRepository {

  final ApiInterface _apiInterface;
  MovieRepository(ApiInterface apiInterface): _apiInterface = apiInterface;

  Future<MovieModel> getMovieDetails(String movieId) async {
    return await _apiInterface.getMovieDetails(movieId);
  }

}
