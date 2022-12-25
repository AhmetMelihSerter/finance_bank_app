import 'package:finance_bank_app/core/base/view/base_view.dart';
import 'package:finance_bank_app/feature/authentication/splash/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (viewModel) {
        viewModel
          ..setContext(context)
          ..init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          body: _buildBody(context),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: FlutterLogo(
        size: context.dynamicWidth(.5),
      ),
    );
  }
}
