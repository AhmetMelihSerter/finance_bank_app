import 'package:finance_bank_app/feature/account_detail/view/account_detail_view.dart';
import 'package:finance_bank_app/feature/authentication/splash/view/splash_view.dart';
import 'package:finance_bank_app/feature/home/view/home_view.dart';
import 'package:finance_bank_app/feature/settings/view/settings_view.dart';
import 'package:finance_bank_app/product/constants/navigation/navigation_constants.dart';
import 'package:flutter/material.dart';

class NavigationRouter {
  NavigationRouter._internal();
  static NavigationRouter? _instance;

  static NavigationRouter get instance =>
      _instance ??= NavigationRouter._internal();

  Route<dynamic> onGenerateRoute(RouteSettings? settings) {
    switch (settings!.name) {
      case NavigationConstants.initialRoute:
      case NavigationConstants.splashRoute:
        return _normalNavigate(
          view: const SplashView(),
          pageName: NavigationConstants.splashRoute,
          settings: settings,
        );
      case NavigationConstants.homeRoute:
        return _normalNavigate(
          view: const HomeView(),
          pageName: NavigationConstants.homeRoute,
          settings: settings,
        );
      case NavigationConstants.settingsRoute:
        return _normalNavigate(
          view: const SettingsView(),
          pageName: NavigationConstants.settingsRoute,
          settings: settings,
        );
      case NavigationConstants.accountDetailRoute:
        return _normalNavigate(
          view: const AccountDetailView(),
          pageName: NavigationConstants.accountDetailRoute,
          settings: settings,
        );
      default:
        return _normalNavigate(
          view: const SplashView(),
          pageName: NavigationConstants.splashRoute,
          settings: settings,
        );
    }
  }

  MaterialPageRoute<dynamic> _normalNavigate({
    required Widget view,
    required String pageName,
    bool fullscreenDialog = false,
    RouteSettings? settings,
  }) {
    return MaterialPageRoute(
      builder: (context) => view,
      fullscreenDialog: fullscreenDialog,
      settings: RouteSettings(
        name: pageName,
        arguments: settings!.arguments,
      ),
    );
  }
}
