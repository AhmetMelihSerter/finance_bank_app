import 'package:finance_bank_app/core/init/navigation/i_navigation_service.dart';

class NavigationService extends INavigationService {
  NavigationService._internal();

  static NavigationService? _instance;

  static NavigationService get instance =>
      _instance ??= NavigationService._internal();

  @override
  Future<void> navigateToPage({required String path, Object? data}) async {
    await navigatorKey.currentState?.pushNamed(
      path,
      arguments: data,
    );
  }

  @override
  Future<void> navigateToPageClear({required String path, Object? data}) async {
    await navigatorKey.currentState?.pushNamedAndRemoveUntil(
      path,
      removeAllOldRoutes,
      arguments: data,
    );
  }
}
