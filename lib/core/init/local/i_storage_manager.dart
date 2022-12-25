// ignore_for_file: always_use_package_imports

import '../../base/model/auth_model.dart';

abstract class IStorageManager {
  Future<void> initialize();

  AuthModel? get authModel;

  void signIn(AuthModel model);

  void signOut();
}
