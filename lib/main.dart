import 'package:device_preview/device_preview.dart';
import 'package:finance_bank_app/core/constants/app/application_constants.dart';
import 'package:finance_bank_app/product/init/navigation/navigation_router.dart';
import 'package:finance_bank_app/product/init/navigation/navigation_service.dart';
import 'package:finance_bank_app/product/init/startup/startup_manager.dart';
import 'package:finance_bank_app/product/init/theme/theme_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StartupManager.instance.initialize();

  runApp(
    DevicePreview(
      // ignore: avoid_redundant_argument_values
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ApplicationConstants.APP_NAME,
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRouter.instance.onGenerateRoute,
      theme: ThemeManager.instance.theme,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
    );
  }
}
