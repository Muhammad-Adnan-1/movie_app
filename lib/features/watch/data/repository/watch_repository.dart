import 'package:movies_app/core/services/api_interface.dart';
import 'package:movies_app/features/watch/data/model/upcoming_movies_api_response.dart';

class WatchRepository {

  final ApiInterface _apiInterface;
  WatchRepository(ApiInterface apiInterface): _apiInterface = apiInterface;

  Future<UpcomingMoviesApiResponse> getUpcomingMovies(int page){
    return _apiInterface.upcomingMovies(page);
  }

}
