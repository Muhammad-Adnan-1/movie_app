import 'package:flutter/cupertino.dart';
import 'package:movies_app/core/error/api_error_handler.dart';
import 'package:movies_app/features/player/data/model/movie_video_api_response.dart';
import 'package:movies_app/features/player/data/repository/player_repository.dart';
import 'package:movies_app/shared/helpers/app_firebase_callback.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerProvider extends ChangeNotifier {
  final PlayerRepository _playerRepository;

  PlayerProvider(PlayerRepository playerRepository)
      : _playerRepository = playerRepository;

  bool _loading = false;
  bool get loading => _loading;

  MovieVideoApiResponse? _movieVideoApiResponse;
  MovieVideoApiResponse? get movieVideoApiResponse => _movieVideoApiResponse;


  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> getMovieVideo(
      String movieId, AppResultCallback callback) async {
    setLoading(true);
    try {
      _movieVideoApiResponse = await _playerRepository.getMovieVideo(movieId);
     // MovieVideo? movieVideo = _movieVideoApiResponse?.results?.firstWhere((element) => element.type == "Trailer", orElse: () => MovieVideo(id: "-1"));
      MovieVideo? movieVideo = _movieVideoApiResponse?.results?.first;

      if(movieVideo != null && movieVideo.id != "-1"){
        initPlayer(movieVideo.key ?? "");
        callback.onSuccess(type: "VIDEO_FOUND", parameters: movieVideo);
      }else{
        callback.onError("Trailer not found!");
      }
      notifyListeners();

    } on CustomException catch (ex) {
      callback.onError(ex.response?['status_message'] ?? "Trailer not found!");
    } catch (ex) {
      callback.onError("Trailer not found!");
    } finally {
      setLoading(false);
    }
  }

  YoutubePlayerController? controller;

  initPlayer(String videoId){
     controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
     controller?.toggleFullScreenMode();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
