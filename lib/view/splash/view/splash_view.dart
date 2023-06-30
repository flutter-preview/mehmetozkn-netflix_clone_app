import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/constants/image/image_constants.dart';
import 'package:netflix_clone_app/core/extension/context_extension.dart';

import '../../../core/base/view/base_view.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel viewModel) =>
          Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Image.asset(
            ImageConstants.instance.projectLogo,
          ),
        ),
      ),
    );
  }
}
