import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/constants.dart';
import 'package:movie/ui/views/home/components/body.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(viewModel),
      body: const Body(),
    );
  }

  AppBar buildAppBar(HomeViewModel model) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsets.only(left: kDefaultPadding),
        icon: SvgPicture.asset('assets/icons/menu.svg'),
        onPressed: () {},
      ),
      title: TextField(controller: model.searchController),
      actions: [
        IconButton(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          icon: SvgPicture.asset('assets/icons/search.svg'),
          onPressed: () async {
            await model.search();
          },
        )
      ],
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
    @override
  void onViewModelReady(HomeViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
