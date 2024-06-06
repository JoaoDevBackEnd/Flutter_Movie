import 'package:fllute_movie_films/data/models/movie.dart';
import 'package:fllute_movie_films/data/movie_api.dart';
import 'package:fllute_movie_films/services_locator.dart';
import 'package:fllute_movie_films/services_locator.dart';
class MovieSearchController{
   final api= get_it<MovieApi>();
  Future<List<Movie>> searchMovie(String query) => api.searchMovies(query);
  

}