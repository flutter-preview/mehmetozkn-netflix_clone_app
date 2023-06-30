import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';
import '../viewmodel/on_board_view_model.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) =>
          const Scaffold(),
    );
  }
}
