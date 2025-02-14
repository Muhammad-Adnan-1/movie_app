import 'package:movies_app/core/services/api_interface.dart';
import 'package:movies_app/features/player/data/model/movie_video_api_response.dart';

class PlayerRepository {

  final ApiInterface _apiInterface;
  PlayerRepository(ApiInterface apiInterface): _apiInterface = apiInterface;

  Future<MovieVideoApiResponse> getMovieVideo(String movieId) async {
    return await _apiInterface.getMovieVideos(movieId);
  }

}
