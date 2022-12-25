import 'package:finance_bank_app/product/init/secure/secure_storage.dart';
import 'package:finance_bank_app/product/init/storage/hive_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kartal/kartal.dart';

class StartupManager {
  StartupManager._internal();

  static final StartupManager _instance = StartupManager._internal();

  static StartupManager get instance => _instance;

  Future<void> initialize() async {
    /// DotEnv Initialization
    await dotenv.load();

    /// SecureStorage Initialization
    await SecureStorage.instance.initialize();

    /// StorageManager Initialization
    await HiveManager.instance.initialize();

    /// DeviceUtility Initialization
    await DeviceUtility.instance.initPackageInfo();
  }
}
