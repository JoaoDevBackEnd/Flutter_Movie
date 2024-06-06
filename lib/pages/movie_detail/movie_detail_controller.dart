import 'dart:async';

import 'package:fllute_movie_films/data/models/movie.dart';
import 'package:fllute_movie_films/data/movie_api.dart';
import 'package:fllute_movie_films/services_locator.dart';

class MovieDetailController{
  final api= get_it<MovieApi>();

  final _controller=StreamController<Movie>();
  late Movie _movie;
  Stream<Movie>get stream => _controller.stream;
  void init(Movie movie){
    _movie=movie;

    getMovie();
  }
  Future<void> getMovie()async{
    var result = await api.getMovie(_movie.id);
    _controller.sink.add(result);
  }
}