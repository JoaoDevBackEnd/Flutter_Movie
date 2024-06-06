import 'package:fllute_movie_films/data/models/movie.dart';
import 'package:fllute_movie_films/data/movie_api.dart';
import 'package:fllute_movie_films/pages/movie_list/movie_list_controller.dart';
import 'package:fllute_movie_films/pages/movie_list/movie_search_delagate.dart';
import 'package:fllute_movie_films/services_locator.dart';
import 'package:fllute_movie_films/pages/movie_list/widgets/movie_item_widget.dart';
import 'package:fllute_movie_films/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final controller = get_it<MovieListController>();
  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MovieSearchDelegate());
            }, 
          icon: const Icon(Icons.search)),
        ],
      ),
      body: StreamBuilder<List<Movie>>(
          stream: controller.stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ProgressIndicatorWidget();
            }
            var movies = snapshot.data!;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                var movie = movies[index];
                return MovieItemWidget(movie: movie,);
              },
            );
          }),
    );
  }
}
