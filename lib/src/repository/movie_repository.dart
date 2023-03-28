import 'dart:convert';

import '../model/movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  Future<List<Movie>?> loadMovie() async {
    var queryParm = {'api_key': 'c61598a9f223b0c3d505172e1f8b8d51'};

    var uri =
        Uri.https('api.themoviedb.org', '3/movie/popular', queryParm);
    var response = await http.get(uri);

    if (response.body != null) {
      Map<String, dynamic> body = json.decode(response.body);
      if (body['results'] != null) {
        List<dynamic> list = body['results'];
        return list.map<Movie>((e) => Movie.fromJson(e)).toList();
      }
    }
  }
}
