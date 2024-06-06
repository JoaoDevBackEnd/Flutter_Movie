import 'dart:async';

import 'package:fllute_movie_films/data/models/movie.dart';
import 'package:fllute_movie_films/data/movie_api.dart';
import 'package:fllute_movie_films/services_locator.dart';

class MovieListController{
  final api= get_it<MovieApi>();

  final _controller=StreamController<List<Movie>>();
  Stream<List<Movie>>get stream => _controller.stream;
  void init(){
    getMovies();
  }
  void getMovies()async{
    var result = await api.getMovies();
    _controller.sink.add(result);
  }
}