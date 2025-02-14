import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_app/features/watch/data/model/upcoming_movies_api_response.dart';
import 'package:movies_app/features/watch/data/repository/watch_repository.dart';

class WatchProvider extends ChangeNotifier{

  final WatchRepository _homeRepository;

  WatchProvider(WatchRepository homeRepository): _homeRepository = homeRepository;

  final PagingController<int, MovieModel> pagingController = PagingController(firstPageKey: 1);

  listenPagination(){
    pagingController.addPageRequestListener((pageKey) {
      _fetchUpcomingMovies(pageKey);
    });
  }

  Future<void> _fetchUpcomingMovies(int pageKey) async {
    try {
      UpcomingMoviesApiResponse newItems = await _homeRepository.getUpcomingMovies(pageKey);
      final isLastPage = (newItems.page ?? 0 ) >= (newItems.totalPages ?? 0);
      if (isLastPage) {
        pagingController.appendLastPage(newItems.results ?? []);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems.results ?? [], nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }


  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }




}