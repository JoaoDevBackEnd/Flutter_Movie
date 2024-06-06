import 'package:fllute_movie_films/data/models/movie.dart';
import 'package:fllute_movie_films/pages/movie_list/movie_search_controller.dart';
import 'package:fllute_movie_films/pages/movie_list/widgets/movie_item_widget.dart';
import 'package:fllute_movie_films/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {
  final controller = MovieSearchController();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return buildSuggestions(context);
    }
    return FutureBuilder(
        future: controller.searchMovie(query),
        builder: (context, pesquisa) {
          if (pesquisa.connectionState == ConnectionState.waiting) {
            return const ProgressIndicatorWidget();
          }
          List<Movie> movies = pesquisa.data!;
          if (movies.isEmpty) {
            return const Center(
              child: Text('NENHUM FILME ENCONTRADO!!!'),
            );
          }
          return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) =>
                  MovieItemWidget(movie: movies[index]));
        });
  }

@override
Widget buildSuggestions(BuildContext context) {
  return const SizedBox.shrink();
}
}