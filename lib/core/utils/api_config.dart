class ApiConfig {

  static String baseUrl = "https://api.themoviedb.org/3";

 static String posterUrl = "https://image.tmdb.org/t/p/w500";
  static String backdropUrl = "https://image.tmdb.org/t/p/w780";

  static String apiKey = "452d46c3f651ffd4c44ea11f643798ef";

  static String getUpcomingAPI(int page){
    return "$baseUrl/movie/upcoming?api_key=$apiKey&page=$page";
  }

  static String getSearchMoviesAPI(String query, int page){
    return "$baseUrl/search/movie?api_key=$apiKey&page=$page&query=$query";
  }

  static String getMovieGenres(){
    return "$baseUrl/genre/movie/list?api_key=$apiKey";
  }

  static String getMovieDetailAPI(String movieId){
    return "$baseUrl/movie/$movieId?api_key=$apiKey";
  }

  static String getMovieVideosAPI(String movieId){
    return "$baseUrl/movie/$movieId/videos?api_key=$apiKey";
  }

}
