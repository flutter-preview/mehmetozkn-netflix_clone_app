import 'package:flutter/material.dart';
import 'package:netflix_clone_app/view/login/view/login_view.dart';

import '../../../view/onboard/view/on_board_view.dart';
import '../../../view/splash/view/splash_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.ONBOARD_VIEW:
        return normalNavigate(const OnBoardView());

      case NavigationConstants.SPLASH_VIEW:
        return normalNavigate(const SplashView());

      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(const LoginView());

      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Not Found Route'))),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
