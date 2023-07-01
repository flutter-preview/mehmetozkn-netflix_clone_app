import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:netflix_clone_app/core/extension/context_extension.dart';
import 'package:netflix_clone_app/core/extension/string_extension.dart';
import 'package:netflix_clone_app/core/init/language/locale_keys.g.dart';

import '../../../core/base/view/base_view.dart';
import '../../../product/widgets/avatar/on_board_circle.dart';
import '../model/on_board_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../viewmodel/on_board_view_model.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) =>
          Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(flex: 5, child: buildOnboardPageView(viewModel)),
            Expanded(flex: 1, child: buildListviewCircles(viewModel)),
            buildLoginButton(context, viewModel),
            const Spacer()
          ],
        ),
      ),
    );
  }

  Row buildListviewCircles(OnBoardViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: ListView.builder(
            itemCount: viewModel.onBoardItems.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Observer(
                builder: (_) {
                  return OnBoardCircle(
                    isSelected: viewModel.currentIndex == index,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  ElevatedButton buildLoginButton(
      BuildContext context, OnBoardViewModel viewModel) {
    return ElevatedButton(
      onPressed: () {
        viewModel.completeOnboardAndOpenLogin();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        fixedSize: MaterialStateProperty.all<Size>(
          Size.fromWidth(context.width * 0.9),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size.fromHeight(context.height * 0.06),
        ),
      ),
      child: Text(LocaleKeys.login_login.locale),
    );
  }

  PageView buildOnboardPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
      itemCount: viewModel.onBoardItems.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildImage(viewModel.onBoardItems[index]),
            buildTitle(viewModel.onBoardItems[index], context),
            buildDescription(viewModel.onBoardItems[index], context),
          ],
        );
      },
      onPageChanged: (index) {
        viewModel.changeCurrentIndex(index);
      },
    );
  }

  Expanded buildDescription(OnBoardModel model, BuildContext context) {
    return Expanded(
      flex: 1,
      child: AutoSizeText(
        model.description,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }

  Expanded buildTitle(OnBoardModel model, BuildContext context) {
    return Expanded(
      flex: 1,
      child: AutoSizeText(
        model.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
      ),
    );
  }

  Expanded buildImage(OnBoardModel model) {
    return Expanded(
      flex: 3,
      child: Image.asset(
        model.imagePath,
      ),
    );
  }
}
