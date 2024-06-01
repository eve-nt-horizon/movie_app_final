import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';

import 'all_genres_viewmodel.dart';

class AllGenresView extends StackedView<AllGenresViewModel> {
  const AllGenresView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AllGenresViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  AllGenresViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AllGenresViewModel();

  @override
  void onViewModelReady(AllGenresViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());

}
