import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:movie/builders/tmdb_request_builder.dart';
import 'package:movie/models/tmdb/tmdb_movie_basic.dart';
import 'package:movie/models/tmdb/tmdb_movies_response.dart';

final String _API_ACCESS_TOKEN =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNTMxOTk1MmRkZmY1OTMyYjk3MGM4NWVkYTYwYmNiNiIsInN1YiI6IjY2NTQwYWNkZTA5OTk4NjM2YjRjZDI1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lJtYvX_j1nAGaebMv9XQwQIQFU5T3jDRqCYSlAcFS-o';

class ApiService {
  final dio = Dio(
    BaseOptions(
      headers: {
        'Accept': 'Application/Json',
        'Authorization': 'Bearer $_API_ACCESS_TOKEN',
        'Host': 'api.themoviedb.org'
      },
    ),
  );

  Future<List<TMDBMovieBasic>> search(String query) async {
    Uri uri = TMDBRequestBuilder.buildWithSearchQuery(query);
    var res = await dio.get(uri.toString());
    return TMDBMoviesResponse.fromJson(res.data).results;
  }

  Future<List<TMDBMovieBasic>> popularMovies() async {
    Uri uri = TMDBRequestBuilder.popularMovies();
    var res = await dio.get(uri.toString());
    return TMDBMoviesResponse.fromJson(res.data).results;
  }

  String poster(String? posterPath) {
    if (posterPath == null) {
      return 'https://th.bing.com/th/id/OIP.hMlLJSmMJky9Rd1JwB86VgHaFl?rs=1&pid=ImgDetMain';
    }
    Uri uri = TMDBRequestBuilder.posterPath(posterPath);
    return uri.toString();
  }
}
