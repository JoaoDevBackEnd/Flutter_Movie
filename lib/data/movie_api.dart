//AQUI SE CRIA OS MÉTODOS QUE ACESSA AS ROTAS DA API

import 'package:dio/dio.dart';
import 'package:fllute_movie_films/data/models/movie.dart';

class MovieApi{
  final Dio _dio=Dio(
    BaseOptions(baseUrl: 'https://apifilmes.webevolui.com')
  );
  Future<List<Movie>> getMovies({int skip=0, int take=50}) async{
     var response = await _dio.get('/Filme?skip$skip&take=$take');
    return (response.data as List).map((item) =>Movie.fromJson(item)).toList();
  }
   Future<List<Movie>> searchMovies(String query) async{
     var response = await _dio.get('/Filme?q=$query');
    return (response.data as List).map((item) =>Movie.fromJson(item)).toList();
  }
   Future<Movie> getMovie(int id) async{
     var response = await _dio.get('/Filme/$id');
    return Movie.fromJson(response.data);
  }


}