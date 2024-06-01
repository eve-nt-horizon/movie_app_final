import 'package:movie/models/tmdb/tmdb_movie_basic.dart';
import 'package:stacked/stacked.dart';

class MovieCarouselService{
    ReactiveList<TMDBMovieBasic> movieList =
      ReactiveList.from([TMDBMovieBasic(id: -1, title: '')]);
}