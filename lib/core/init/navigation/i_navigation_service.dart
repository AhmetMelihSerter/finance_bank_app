import 'package:flutter/material.dart';

abstract class INavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext? get context => navigatorKey.currentContext;

  // ignore: prefer_function_declarations_over_variables
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  Future<void> navigateToPage({required String path, Object? data});
  Future<void> navigateToPageClear({required String path, Object? data});
}
