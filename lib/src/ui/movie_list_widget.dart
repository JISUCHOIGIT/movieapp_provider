import 'package:flutter/material.dart';
import 'package:movieapp_provider/src/provider/movie_provider.dart';
import 'package:provider/provider.dart';

import '../model/movie.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 리스트 호출
    MovieProvider _movieProvider =
        Provider.of<MovieProvider>(context, listen: false);

    _movieProvider.loadMovies();

    Widget _makeMovieOne(Movie movie) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(movie.posterUrl),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Text(
                      movie.overview,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 8,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      );
    }

    Widget _makeListView(List<Movie> movies) {
      return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            height: 200,

            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 0),
                )
              ],
            ),
            child: _makeMovieOne(movies[index]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: movies.length,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Provider',
        ),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, widget) {
          if (provider.movies != null && provider.movies.length > 0) {
            return _makeListView(provider.movies);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
