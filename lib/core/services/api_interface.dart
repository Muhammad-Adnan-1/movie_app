

import 'package:movies_app/features/search/data/model/movie_genre_api_response.dart';
import 'package:movies_app/features/watch/data/model/upcoming_movies_api_response.dart';
import 'package:movies_app/features/player/data/model/movie_video_api_response.dart';

abstract class ApiInterface{

  Future<MovieGenreApiResponse> movieGenreList();
  Future<UpcomingMoviesApiResponse> upcomingMovies(int page);
  Future<UpcomingMoviesApiResponse> searchMovies(String query, int page);
  Future<MovieModel> getMovieDetails(String movieId);
  Future<MovieVideoApiResponse> getMovieVideos(String movieId);

}
