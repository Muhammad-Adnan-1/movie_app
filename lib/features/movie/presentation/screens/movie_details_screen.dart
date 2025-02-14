import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/app/routes/route_names.dart';
import 'package:movies_app/features/watch/data/model/upcoming_movies_api_response.dart';
import 'package:movies_app/features/movie/application/provider/movie_provider.dart';
import 'package:movies_app/shared/helpers/app_firebase_callback.dart';
import 'package:movies_app/shared/helpers/common_views.dart';
import 'package:movies_app/shared/helpers/helper.dart';
import 'package:movies_app/shared/styles/color.dart';
import 'package:movies_app/shared/widgets/base_widget.dart';
import 'package:movies_app/shared/widgets/custom_button.dart';
import 'package:movies_app/shared/widgets/custom_outlined_border_button.dart';
import 'package:movies_app/shared/widgets/loading_widget.dart';
import 'package:movies_app/shared/widgets/network_image_with_placeholder.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen>
    implements AppResultCallback {
  @override
  Widget build(BuildContext context) {
    var movieProvider = MovieProvider(Provider.of(context));

    movieProvider.getMovieDetail(widget.movieId, this);
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: BaseWidget(builder: (context, provider, child){
        return provider.loading
            ? const LoadingWidget()
            : OrientationBuilder(builder: (context, orientation){
              return ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                      height: orientation == Orientation.landscape ? (MediaQuery.of(context).size.width / 2): (MediaQuery.of(context).size.height / 2),
                      child: Stack(
                        children: [
                          NetworkImageWithPlaceHolder(
                            imageUrl: provider.movieModel?.posterPath,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    theme.colorScheme.secondary
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                )),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: kToolbarHeight,
                                  margin: const EdgeInsets.only(top: 37),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            context.pop();
                                          },
                                          icon: Icon(
                                            Icons.keyboard_arrow_left_rounded,
                                            color: theme.colorScheme.surface,
                                            size: 30,
                                          )),
                                      Text(
                                        "Watch",
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                            color:
                                            theme.colorScheme.surface,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  )),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                    MediaQuery.of(context).size.width *
                                        0.15),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      provider.movieModel?.originalTitle ?? "",
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "In Theaters ${provider.movieModel?.releaseDate?.toFormattedDateString()}",
                                      style: theme.textTheme.bodyLarge
                                          ?.copyWith(
                                          color: theme.colorScheme.surface,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    CustomButton(
                                      buttonText: "Get Tickets",
                                      backgroundColor: AppColors.blueColor,
                                      fontSize: 14,
                                      onPress: (){
                                        context.pushNamed(RouteNames.booking, extra: provider.movieModel);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomOutlinedBorderButton(
                                      onPress: (){
                                        context.pushNamed(RouteNames.player, extra: widget.movieId);
                                      },
                                      title: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            size: 24,
                                            color: theme.colorScheme.surface,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "Watch Trailer",
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(
                                                color: theme
                                                    .colorScheme.surface,
                                                fontWeight:
                                                FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      borderColor: AppColors.blueColor,
                                      fontSize: 14,
                                      enableBorder: true,
                                    ),
                                    const SizedBox(
                                      height: 34,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  SizedBox(
                    height: orientation == Orientation.landscape ? (MediaQuery.of(context).size.width / 2): (MediaQuery.of(context).size.height / 2),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                              MediaQuery.of(context).size.width * 0.1),
                          child: Text(
                            "Genres",
                            style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                              itemCount: provider.movieModel?.genres?.length ?? 0,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width *
                                      0.09),
                              itemBuilder: (context, index) {
                                Genre? genre = provider.movieModel?.genres?[index];
                                return Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(12),
                                      color: CommonViews.getRandomColor(),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 3),
                                    child: Text(genre?.name ?? "",
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                            color: theme
                                                .colorScheme.surface,
                                            height: 1.5,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12)),
                                  ),
                                );
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                              MediaQuery.of(context).size.width * 0.1,
                              vertical: 18),
                          child: Divider(
                            thickness: 0.5,
                            height: 0.5,
                            color: theme.disabledColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                              MediaQuery.of(context).size.width * 0.1),
                          child: Text(
                            "Overview",
                            style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(context).size.width *
                                    0.1),
                            child: Text(
                              provider.movieModel?.overview ?? "",
                              maxLines: 9,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 19 / 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              );
        });
      }, provider: movieProvider),
      // bottomNavigationBar: ,
    );
  }

  @override
  void onError(String message) {
    CommonViews.showErrorToast(message);
  }

  @override
  void onSuccess({String? type, dynamic parameters}) {}
}
