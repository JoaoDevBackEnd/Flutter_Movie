import 'package:fllute_movie_films/data/models/movie.dart';
import 'package:fllute_movie_films/data/movie_api.dart';
import 'package:fllute_movie_films/pages/movie_detail/movie_detail_controller.dart';
import 'package:fllute_movie_films/pages/movie_detail/widgets/movie_detail_about_widget.dart';
import 'package:fllute_movie_films/pages/movie_detail/widgets/movie_detail_cover.dart';
import 'package:fllute_movie_films/pages/movie_list/movie_list_controller.dart';
import 'package:fllute_movie_films/services_locator.dart';
import 'package:fllute_movie_films/pages/movie_list/widgets/movie_item_widget.dart';
import 'package:fllute_movie_films/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key,required this.movie});
  final Movie movie;
  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  //REGISTRAMOS A INSTANCIA DO DETALHES
  final controller = get_it.registerSingleton(MovieDetailController());
  @override
  void initState() {
    controller.init(widget.movie);
    super.initState();
  }
  //QUANDO ENTRAR EM OUTRO FILME IRÁ DESASOCIAR O REGISTRO JÁ CRIADO E CHAMARA OUTRO
  @override
  void dispose(){
    get_it.unregister(instance: controller);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var movie=widget.movie;
    return Scaffold(
      body: StreamBuilder<Movie>(
          initialData: widget.movie,
          stream: controller.stream,
          builder: (context, snapshot) {

            var movie = snapshot.data!;
           if (snapshot.connectionState == ConnectionState.waiting) {
              return const ProgressIndicatorWidget();
            }
            
            return CustomScrollView(
              slivers: [
                MovieDetailCoverWidget(movie: movie),
                MovieDetailAboutWidget(movie: movie)
              ],
            );    
          }),
    );
  }
}
