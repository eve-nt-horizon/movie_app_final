import 'package:flutter/material.dart';
import 'package:movie/constants.dart';
import 'package:movie/ui/widgets/common/movie_carousel/movie_card.dart';
import 'package:stacked/stacked.dart';

import 'movie_carousel_model.dart';

class MovieCarousel extends StackedView<MovieCarouselModel> {
  const MovieCarousel({super.key});

  @override
  Widget builder(
    BuildContext context,
    MovieCarouselModel viewModel,
    Widget? child,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
            onPageChanged: (value) {
              viewModel.setCurrentPage(value);
            },
            controller: viewModel.pageController,
            physics: const ClampingScrollPhysics(),
            itemCount: viewModel.movieList.length,
            itemBuilder: (context, index) =>
                MovieCard(movie: viewModel.movieList[index])),
      ),
    );
  }

  @override
  MovieCarouselModel viewModelBuilder(
    BuildContext context,
  ) =>
      MovieCarouselModel();
}
