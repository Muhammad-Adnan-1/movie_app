import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_app/core/error/api_error_handler.dart';
import 'package:movies_app/features/search/data/model/movie_genre_api_response.dart';
import 'package:movies_app/features/watch/data/model/upcoming_movies_api_response.dart';
import 'package:movies_app/features/search/data/repository/search_repository.dart';
import 'package:movies_app/shared/helpers/app_firebase_callback.dart';

class SearchProvider extends ChangeNotifier {
  final SearchRepository _searchRepository;

  SearchProvider(SearchRepository searchRepository)
      : _searchRepository = searchRepository;

  TextEditingController searchController = TextEditingController();

  bool _isSearch = false;
  bool get isSearch => _isSearch;

  MovieGenreApiResponse? _movieGenreApiResponse;
  MovieGenreApiResponse? get movieGenreApiResponse => _movieGenreApiResponse;

  String query = "";

  bool loading = false;

  setLoading(bool value){
    loading = value;
    notifyListeners();
  }

  setSearch(String? text) {
    if(text?.isEmpty == false) {
      _isSearch = true;
      query = text!;
      notifyListeners();
      pagingController.refresh();
    }else{
      _isSearch = false;
      notifyListeners();

    }
  }

  final PagingController<int, MovieModel> pagingController = PagingController(firstPageKey: 1);

  listenPagination(){
    pagingController.addPageRequestListener((pageKey) {
      if(query.isNotEmpty) _fetchUpcomingMovies(query, pageKey);
    });
  }

  Future<void> _fetchUpcomingMovies(String query, int pageKey) async {
    try {
      UpcomingMoviesApiResponse newItems = await _searchRepository.searchMovies(query, pageKey);
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


  Future<void> getMovieGenreList(
       AppResultCallback callback) async {
    setLoading(true);
    try {
      _movieGenreApiResponse = await _searchRepository.moviesGenreList();
      notifyListeners();

      callback.onSuccess(type: "VIDEO_FOUND");


    } on CustomException catch (ex) {
      callback.onError(ex.response?['status_message'] ?? "Trailer not found!");
    } catch (ex) {
      callback.onError("Trailer not found!");
    } finally {
      setLoading(false);
    }
  }


  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }


}
