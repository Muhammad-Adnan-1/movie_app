import 'package:movies_app/core/api/api_handler.dart';
import 'package:movies_app/core/services/api_calls.dart';
import 'package:movies_app/features/home/data/repository/home_repository.dart';
import 'package:movies_app/features/watch/data/repository/watch_repository.dart';
import 'package:movies_app/features/movie/data/repository/movie_repository.dart';
import 'package:movies_app/features/player/data/repository/player_repository.dart';
import 'package:movies_app/features/search/data/repository/search_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentProvider,
  ...dependentProvider,
  ...uiConsumeAbleProvider
];

List<SingleChildWidget> independentProvider = [
  //Provider.value(value: FirebaseFireStoreService()),
  Provider.value(value: ApiHandler()),
  Provider.value(value: HomeRepository()),
];

List<SingleChildWidget> dependentProvider = [
  ProxyProvider<ApiHandler, ApiCalls>(update: (context, apiHandlers, _) {
    return ApiCalls(apiHandlers);
  }),
  ProxyProvider<ApiCalls, WatchRepository>(update: (context, apiCalls, _) {
    return WatchRepository(apiCalls);
  }),
  ProxyProvider<ApiCalls, MovieRepository>(update: (context, apiCalls, _) {
    return MovieRepository(apiCalls);
  }),
  ProxyProvider<ApiCalls, PlayerRepository>(update: (context, apiCalls, _) {
    return PlayerRepository(apiCalls);
  }),
  ProxyProvider<ApiCalls, SearchRepository>(update: (context, apiCalls, _) {
    return SearchRepository(apiCalls);
  }),
];

List<SingleChildWidget> uiConsumeAbleProvider = [];
