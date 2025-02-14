import 'package:dio/dio.dart';
import 'package:movies_app/core/api/api_handler.dart';
import 'package:movies_app/core/services/api_interface.dart';
import 'package:movies_app/core/utils/api_config.dart';
import 'package:movies_app/features/search/data/model/movie_genre_api_response.dart';
import 'package:movies_app/features/watch/data/model/upcoming_movies_api_response.dart';
import 'package:movies_app/features/player/data/model/movie_video_api_response.dart';

class ApiCalls extends ApiInterface {
  final ApiHandler _apiHandler;

  ApiCalls(ApiHandler apiHelper) : _apiHandler = apiHelper;

  @override
  Future<MovieGenreApiResponse> movieGenreList() async {
    Response response = await _apiHandler.getHttp(ApiConfig.getMovieGenres());
    return MovieGenreApiResponse.fromJson(response.data);
  }

  @override
  Future<UpcomingMoviesApiResponse> upcomingMovies(int page) async {
    Response response = await _apiHandler.getHttp(ApiConfig.getUpcomingAPI(page));
    return UpcomingMoviesApiResponse.fromJson(response.data);
  }

  @override
  Future<MovieModel> getMovieDetails(String movieId) async {
    Response response = await _apiHandler.getHttp(ApiConfig.getMovieDetailAPI(movieId));
    return MovieModel.fromJson(response.data);
  }


  @override
  Future<MovieVideoApiResponse> getMovieVideos(String movieId) async {
    Response response = await _apiHandler.getHttp(ApiConfig.getMovieVideosAPI(movieId));
    return MovieVideoApiResponse.fromJson(response.data);
  }

  @override
  Future<UpcomingMoviesApiResponse> searchMovies(String query, int page) async {
    Response response = await _apiHandler.getHttp(ApiConfig.getSearchMoviesAPI(query, page));
    return UpcomingMoviesApiResponse.fromJson(response.data);
  }
}
