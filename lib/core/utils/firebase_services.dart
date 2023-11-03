import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_movie_app/core/utils/movie_model.dart';

class FirebaseServices {
  Future<bool> addToFavourite(MovieModel movieModel) async {
    final json = movieModel.toJson();
    // print(json);
    await FirebaseFirestore.instance.collection("favouriateMovies").add(json);
    return true;
  }

  Future<List<MovieModel>> getFavourite() async {
    //  print('$_baseUrl$endPoint');
    print('enter');
    var data =
        await FirebaseFirestore.instance.collection("favouriateMovies").get();
    List<MovieModel> movies = [];
    print('data:${data.size}');
    for (var element in data.docs) {
      var movie = element.data();
      print('element: ${element.data()}');
      print('id:${movie['id']}d');
      Map<String, dynamic> json = {
        'adult': movie['adult'],
        'backdrop_path': movie['backdrop_path'],
        'genre_ids': movie['genre_ids'],
        'id': movie['id'] as int,
        'original_language': movie['original_language'],
        'original_title': movie['original_title'],
        'overview': movie['overview'],
        'popularity': movie['popularity'],
        'poster_path': movie['poster_path'],
        'release_date': movie['release_date'],
        'title': movie['title'],
        'video': movie['video'],
        'vote_average': movie['vote_average'],
        'vote_count': movie['vote_count'],
      };
      MovieModel model = MovieModel.fromJson(json);

      movies.add(model);
    }
    return movies;
  }
}
