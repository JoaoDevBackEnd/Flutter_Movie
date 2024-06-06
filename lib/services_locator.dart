import 'package:fllute_movie_films/data/movie_api.dart';
import 'package:fllute_movie_films/pages/movie_list/movie_list_controller.dart';
import 'package:get_it/get_it.dart';

final get_it=GetIt.instance;

void setupGetIt(){
    get_it.registerLazySingleton<MovieApi>(() =>MovieApi());
    get_it.registerLazySingleton<MovieListController>(() =>MovieListController());

}