import 'package:movie/models/tmdb/tmdb_movie_basic.dart';
import 'package:movie/services/api_service.dart';
import 'package:movie/services/movie_carousel_service.dart';
import 'package:stacked/stacked.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _apiService = locator<ApiService>();
  final _movieCarouselService = locator<MovieCarouselService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic
    List<TMDBMovieBasic> movies = await _apiService.popularMovies();
    _movieCarouselService.movieList.assignAll(movies);

    _navigationService.replaceWithHomeView();
  }
}
