import 'package:fllute_movie_films/data/models/movie.dart';
import 'package:flutter/material.dart';

class MovieDetailCoverWidget extends StatelessWidget {
  const MovieDetailCoverWidget({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              movie.urlImage,
              fit: BoxFit.cover,
            ),     
          ],
        ),
      ),
    );
  }
}