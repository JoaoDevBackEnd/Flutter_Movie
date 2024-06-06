import 'package:duration/duration.dart';
import 'package:fllute_movie_films/data/models/movie.dart';
import 'package:flutter/material.dart';

class MovieDetailAboutWidget extends StatelessWidget {
  const MovieDetailAboutWidget({super.key, required this.movie});

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
              
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12.0),
                    Text(movie.name,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Text(prettyDuration(Duration(minutes: movie.duration),
                            abbreviated: true, delimiter: '', spacer: '')),
                        const Text(' | '),
                        Text(movie.gender),
                        Text(' - Ano ${movie.year}')
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text('SOBRE O FILME'),
                    const SizedBox(height: 8.0),
                    Text('${movie.description}')
                  ],
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
