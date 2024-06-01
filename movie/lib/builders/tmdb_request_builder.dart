import 'package:movie/builders/https_uri_builder.dart';

class TMDBRequestBuilder {
  static HttpsUriBuilder uriBuilder = HttpsUriBuilder.create();

  static const String _baseUrl = 'api.themoviedb.org';
  static const String _imgUrl = 'image.tmdb.org';
  static Uri buildWithGenres(List<int> genres) {
    String genreString = genres.join('&');
    return uriBuilder
        .setAuthority(_baseUrl)
        .setPath('/3/discover/movie')
        .setQueryParams({'with_genres': genreString}).build();
  }

  static Uri buildWithSearchQuery(String query) {
    return uriBuilder
        .setAuthority(_baseUrl)
        .setPath('/3/search/movie')
        .setQueryParams({'query': query}).build();
  }

  static Uri popularMovies() {
    return uriBuilder
        .setAuthority(_baseUrl)
        .setPath('/3/movie/popular')
        .build();
  }

  static Uri buildWithIdQuery(int id) {
    return uriBuilder.setAuthority(_baseUrl).setPath('/3/movie/$id').build();
  }

  static Uri posterPath(String posterPath) {
    return uriBuilder
        .setAuthority(_imgUrl)
        .setPath('/t/p/original/$posterPath')
        .build();
  }

  static Uri allGenres() {
    return uriBuilder
        .setAuthority(_baseUrl)
        .setPath('/3/genre/movie/list')
        .build();
  }
}
