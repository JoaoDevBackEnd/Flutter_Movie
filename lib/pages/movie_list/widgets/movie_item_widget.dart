import 'package:duration/duration.dart';
import 'package:fllute_movie_films/data/models/movie.dart';
import 'package:fllute_movie_films/pages/movie_detail/movie_detail_page.dart';
import 'package:flutter/material.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 8.0,
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2.0),
                child: Image.network(
                  movie.urlImage,
                  fit: BoxFit.cover,
                  width: 120,
                  height: 154,
                ),
              )),
          const SizedBox(
            width: 8.0,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12.0),
              Text(
                movie.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Text(prettyDuration(Duration(minutes: movie.duration),
                      abbreviated: true, delimiter: '',spacer: '')),
                  const Text(' | '),
                  Text(movie.gender),
                ],
              ),
              const SizedBox(height: 8.0),
              Text('Ano ${movie.year}')
            ],
          ))
        ],
      ),
      onTap: (){
        //AQUI SERÁ A NAVEGAÇÃO DO SEU ITEM ELE SE TORNA CLICAVÉL COM O WIDGET INKWEEL
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MovieDetailPage(movie: movie)),
        );
      },
    );
  }
}
