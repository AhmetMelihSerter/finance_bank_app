import 'package:finance_bank_app/core/base/view_model/base_view_model.dart';
import 'package:finance_bank_app/product/constants/navigation/navigation_constants.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SplashViewModel extends BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    Future.delayed(viewModelContext.durationSlow, _navigateLogin);
  }

  void _navigateLogin() {
    viewModelContext.navigateToReset(NavigationConstants.homeRoute);
  }
}
