import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:netflix_clone_app/core/constants/image/image_constants.dart';
import 'package:netflix_clone_app/core/constants/navigation/navigation_constants.dart';
import 'package:netflix_clone_app/core/extension/string_extension.dart';
import 'package:netflix_clone_app/core/init/navigation/navigation_service.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../model/on_board_model.dart';
part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    onBoardItems.addAll([
      OnBoardModel(
        LocaleKeys.onBoard_page1_title.locale,
        LocaleKeys.onBoard_page1_desc.locale,
        ImageConstants.instance.onboard_1,
      ),
      OnBoardModel(
        LocaleKeys.onBoard_page2_title.locale,
        LocaleKeys.onBoard_page2_desc.locale,
        ImageConstants.instance.onboard_2,
      ),
      OnBoardModel(
        LocaleKeys.onBoard_page3_title.locale,
        LocaleKeys.onBoard_page3_desc.locale,
        ImageConstants.instance.onboard_3,
      ),
    ]);
  }

  List<OnBoardModel> onBoardItems = [];

  @observable
  int currentIndex = 0;

  @action
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  void completeOnboardAndOpenLogin() {
    NavigationService.instance
        .navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
  }
}
