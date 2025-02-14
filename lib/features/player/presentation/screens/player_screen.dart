import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/features/player/application/provider/player_provider.dart';
import 'package:movies_app/shared/helpers/app_firebase_callback.dart';
import 'package:movies_app/shared/helpers/common_views.dart';
import 'package:movies_app/shared/widgets/base_widget.dart';
import 'package:movies_app/shared/widgets/loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerScreen extends StatefulWidget {
  final String movieId;

  const PlayerScreen({super.key, required this.movieId});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen>
    implements AppResultCallback {
  @override
  Widget build(BuildContext context) {
    var playerProvider = PlayerProvider(Provider.of(context));

    playerProvider.getMovieVideo(widget.movieId, this);
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: BaseWidget<PlayerProvider>(
          builder: (context, provider, child) {
            return provider.loading || provider.controller == null
                ? const LoadingWidget()
                : YoutubePlayer(
                    controller: provider.controller!,
                    showVideoProgressIndicator: true,
                    topActions: [
                      IconButton(
                          onPressed: () {
                            provider.controller?.toggleFullScreenMode();
                            context.pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: theme.colorScheme.surface,
                          ))
                    ],
                    progressIndicatorColor: theme.primaryColor,
                    aspectRatio: 9 / 16,
                    onEnded: (metaData) {
                      provider.controller?.toggleFullScreenMode();
                      context.pop();
                    },
                    progressColors: ProgressBarColors(
                      playedColor: theme.primaryColor,
                      handleColor: theme.primaryColor,
                    ),
                    onReady: () {
                      //controller.addListener(listener);
                    },
                  );
          },
          provider: playerProvider),
      // bottomNavigationBar: ,
    );
  }

  @override
  void onError(String message) {
    CommonViews.showErrorToast(message);
    Future.delayed(const Duration(milliseconds: 200)).then((v){
      if(mounted) {
        context.pop();
      }
    });
  }

  @override
  void onSuccess({String? type, dynamic parameters}) {
    if (type == "VIDEO_FOUND") {}
  }
}
