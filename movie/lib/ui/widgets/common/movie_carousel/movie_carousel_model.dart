import 'package:flutter/material.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/models/tmdb/tmdb_movie_basic.dart';
import 'package:movie/services/movie_carousel_service.dart';
import 'package:stacked/stacked.dart';

final _movieCarouselService = locator<MovieCarouselService>();

class MovieCarouselModel extends StreamViewModel {
  int currentPage = 1;
  late PageController _pageController;

  @override
  Stream get stream => _movieCarouselService.movieList.onChange;
  ReactiveList<TMDBMovieBasic> get movieList => _movieCarouselService.movieList;
  PageController get pageController => _pageController;

  MovieCarouselModel() {
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: currentPage,
    );
  }

  void setCurrentPage(int value) {
    currentPage = value;
    rebuildUi();
  }

  @override
  void onData(data) {
    print(data.op);
    super.onData(data);
    rebuildUi();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
