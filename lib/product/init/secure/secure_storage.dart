import 'dart:convert';

import 'package:finance_bank_app/core/init/secure/i_secure_manager.dart';
import 'package:finance_bank_app/product/constants/app/product_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class SecureStorage extends ISecureManager {
  SecureStorage._internal();

  static SecureStorage? _instance;

  static SecureStorage get instance => _instance ??= SecureStorage._internal();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  late String _secureKey;

  @override
  Future<void> initialize() async {
    _secureKey = ProductConstants.SECURE_KEY;
    final containsEncryptionKey = await _secureStorage.containsKey(
      key: _secureKey,
    );
    if (!containsEncryptionKey) {
      await createKey();
    }
  }

  @override
  Future<void> createKey() async {
    final encryptionKey = Hive.generateSecureKey();
    await _secureStorage.write(
      key: _secureKey,
      value: base64Url.encode(encryptionKey),
    );
  }

  @override
  Future<List<int>> readKey() async {
    final key = await _secureStorage.read(key: _secureKey);
    if (key == null) {
      throw Exception('Secure key not found.');
    }
    return base64Url.decode(key);
  }
}
