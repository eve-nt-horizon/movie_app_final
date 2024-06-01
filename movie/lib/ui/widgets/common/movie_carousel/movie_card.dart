import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/constants.dart';
import 'package:movie/models/tmdb/tmdb_movie_basic.dart';
import 'package:movie/services/api_service.dart';

final _apiService = locator<ApiService>();

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});
  final TMDBMovieBasic movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        closedBuilder: (context, action) => buildMovieCard(context),
        openBuilder: (context, action) => Center(),
      ),
    );
  }

  Column buildMovieCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [kDefaultShadow],
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  _apiService.poster(movie.posterPath),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          child: Text(
            movie.title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/star_fill.svg',
              height: 20,
            ),
            const SizedBox(
              width: kDefaultPadding / 2,
            ),
            Text(
              '${movie.voteAverage}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        )
      ],
    );
  }
}
