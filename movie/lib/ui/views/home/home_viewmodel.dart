import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/models/tmdb/tmdb_movie_basic.dart';
import 'package:movie/services/api_service.dart';
import 'package:movie/services/movie_carousel_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _movieCarouselService = locator<MovieCarouselService>();
  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;
  Future search() async {
    if (_searchController.text.isEmpty) return;
    List<TMDBMovieBasic> res = await _apiService.search(_searchController.text);
    print(res);
  }

  Future runStartupLogic() async {
    List<TMDBMovieBasic> movies = await _apiService.popularMovies();
    _movieCarouselService.movieList.assignAll(movies);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }
}
