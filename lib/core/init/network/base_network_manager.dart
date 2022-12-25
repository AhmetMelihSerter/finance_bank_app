// ignore_for_file: always_use_package_imports

import '../local/i_storage_manager.dart';
import '../logger/i_logger_manager.dart';
import '../navigation/i_navigation_service.dart';

abstract class BaseNetworkManager {
  IStorageManager get storageManager;

  INavigationService get navigationService;

  ILoggerManager get loggerManager;
}
