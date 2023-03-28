import 'package:flutter/cupertino.dart';

import '../model/movie.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _movies = [];

  // getter
  List<Movie> get movies => _movies;

  _loadMovies(){
    //repository
    
  }


}