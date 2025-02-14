import 'package:flutter/cupertino.dart';
import 'package:movies_app/core/error/api_error_handler.dart';
import 'package:movies_app/features/watch/data/model/upcoming_movies_api_response.dart';
import 'package:movies_app/features/movie/data/repository/movie_repository.dart';
import 'package:movies_app/shared/helpers/app_firebase_callback.dart';

class MovieProvider extends ChangeNotifier {
  final MovieRepository _movieRepository;

  MovieProvider(MovieRepository movieRepository)
      : _movieRepository = movieRepository;

  bool _loading = false;
  bool get loading => _loading;

  MovieModel? _movieModel;

  MovieModel? get movieModel => _movieModel;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> getMovieDetail(
      String movieId, AppResultCallback callback) async {
    setLoading(true);
    try {
      _movieModel = await _movieRepository.getMovieDetails(movieId);
      notifyListeners();

      callback.onSuccess();
    } on CustomException catch (ex) {
      callback
          .onError(ex.response?['status_message'] ?? "Something went wrong!");
    } catch (ex) {
      callback.onError("Something went wrong!");
    } finally {
      setLoading(false);
    }
  }
}
