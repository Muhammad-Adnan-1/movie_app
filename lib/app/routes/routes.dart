import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/app/routes/route_names.dart';
import 'package:movies_app/features/booking/presentation/screens/booking_screen.dart';
import 'package:movies_app/features/booking/presentation/screens/seat_selection_page.dart';
import 'package:movies_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:movies_app/features/home/presentation/screens/home_screen.dart';
import 'package:movies_app/features/library/presentation/screens/library_screen.dart';
import 'package:movies_app/features/more/presentation/screens/more_screen.dart';
import 'package:movies_app/features/watch/data/model/upcoming_movies_api_response.dart';
import 'package:movies_app/features/watch/presentation/screens/watch_screen.dart';
import 'package:movies_app/features/movie/presentation/screens/movie_details_screen.dart';
import 'package:movies_app/features/player/presentation/screens/player_screen.dart';
import 'package:movies_app/features/search/presentation/screens/search_screen.dart';
import 'package:movies_app/features/splash/presentation/screens/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteNames.splash,
  routes: <RouteBase>[
    GoRoute(
      path: RouteNames.splash,
      name: RouteNames.splash,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),

    ShellRoute(
        builder: (context, state, child){
          return HomeScreen(child: child,);
        },
        routes: [
          GoRoute(
            path: RouteNames.dashboard,
            name: RouteNames.dashboard,
            builder: (BuildContext context, GoRouterState state) {
              return const DashboardScreen();
            },
          ),
          GoRoute(
            path: RouteNames.watch,
            name: RouteNames.watch,
            builder: (BuildContext context, GoRouterState state) {
              return const WatchScreen();
            },
          ),
          GoRoute(
            path: RouteNames.media,
            name: RouteNames.media,
            builder: (BuildContext context, GoRouterState state) {
              return const LibraryScreen();
            },
          ),
          GoRoute(
            path: RouteNames.more,
            name: RouteNames.more,
            builder: (BuildContext context, GoRouterState state) {
              return const MoreScreen();
            },
          ),


        ]),

    GoRoute(
      path: RouteNames.search,
      name: RouteNames.search,
      builder: (BuildContext context, GoRouterState state) {
        return const SearchScreen();
      },
    ),

    GoRoute(
      path: RouteNames.movieDetails,
      name: RouteNames.movieDetails,
      builder: (BuildContext context, GoRouterState state) {
        String extra = state.extra as String;
        return MovieDetailsScreen(movieId: extra,);
      },
    ),

    GoRoute(
      path: RouteNames.player,
      name: RouteNames.player,
      builder: (BuildContext context, GoRouterState state) {
        String extra = state.extra as String;
        return PlayerScreen(movieId: extra,);
      },
    ),

    GoRoute(
      path: RouteNames.booking,
      name: RouteNames.booking,
      builder: (BuildContext context, GoRouterState state) {
        MovieModel? model = state.extra as MovieModel?;
        return BookingScreen(movieModel: model);
      },
    ),
    GoRoute(
      path: RouteNames.seatSelection,
      name: RouteNames.seatSelection,
      builder: (BuildContext context, GoRouterState state) {
        MovieModel? model = state.extra as MovieModel?;
        return SeatSelectionPage(movieModel: model);
      },
    ),

  ],
);
