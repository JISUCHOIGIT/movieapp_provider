import 'package:flutter/cupertino.dart';
import 'package:movieapp_provider/src/repository/movie_repository.dart';

import '../model/movie.dart';

class MovieProvider extends ChangeNotifier {
  MovieRepository _movieRepository = MovieRepository();

  List<Movie> _movies = [];

  // getter
  List<Movie> get movies => _movies;



  //repository
  loadMovies() async {
    List<Movie>? listMovies = await _movieRepository.loadMovie();

    _movies = listMovies!;
    notifyListeners();
  }
}
