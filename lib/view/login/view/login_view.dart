import 'package:flutter/material.dart';
import 'package:netflix_clone_app/view/login/viewmodel/login_view_model.dart';

import '../../../core/base/view/base_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) =>
          const Scaffold(),
    );
  }
}
