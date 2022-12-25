// ignore_for_file: always_use_package_imports

import '../../base/model/auth_model.dart';

abstract class IBugTracking {
  void createUser(AuthModel model);
  void deleteUser();
  void captureException(dynamic exception, StackTrace? stackTrace);
}
