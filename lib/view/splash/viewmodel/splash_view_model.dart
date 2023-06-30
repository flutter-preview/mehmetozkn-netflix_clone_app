import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:netflix_clone_app/core/extension/context_extension.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';
part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    startTimer();
  }

  startTimer() async {
    var duration = viewModelContext.mediumDuration;
    return Timer(duration, route);
  }

  void route() {
    NavigationService.instance.navigateToPageClear(
      path: NavigationConstants.ONBOARD_VIEW,
    );
  }
}
