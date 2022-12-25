import 'dart:io';

import 'package:finance_bank_app/core/base/model/auth_model.dart';
import 'package:finance_bank_app/core/init/local/i_storage_manager.dart';
import 'package:finance_bank_app/feature/account_detail/model/account_detail_model.dart';
import 'package:finance_bank_app/feature/account_detail/model/account_detail_response.dart';
import 'package:finance_bank_app/feature/account_detail/model/card_activity.dart';
import 'package:finance_bank_app/feature/home/model/home_response.dart';
import 'package:finance_bank_app/feature/home/model/my_card.dart';
import 'package:finance_bank_app/feature/home/model/recent_activity.dart';
import 'package:finance_bank_app/product/init/secure/secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveManager extends IStorageManager {
  HiveManager._internal();

  static HiveManager? _instance;

  static HiveManager get instance => _instance ??= HiveManager._internal();

  final String _authBoxName = 'auth';
  final String _authName = 'authName';

  final String _homeResponseBoxName = 'homeResponse';
  final String _homeResponseName = 'homeResponseName';

  final String _accountDetailResponseBoxName = 'accountDetailResponse';
  final String _accountDetailResponseName = 'accountDetailResponseName';

  @override
  Future<void> initialize() async {
    await Hive.initFlutter();
    final secureManager = SecureStorage.instance;
    List<int>? key;
    Hive
      ..registerAdapter(AuthModelAdapter())
      ..registerAdapter(HomeResponseAdapter())
      ..registerAdapter(MyCardAdapter())
      ..registerAdapter(RecentActivityAdapter())
      ..registerAdapter(AccountDetailResponseAdapter())
      ..registerAdapter(AccountDetailModelAdapter())
      ..registerAdapter(CardActivityAdapter());
    if (kDebugMode && Platform.isIOS) {
      await Hive.openBox<AuthModel>(
        _authBoxName,
      );
      await Hive.openBox<HomeResponse>(
        _homeResponseBoxName,
      );
      await Hive.openBox<AccountDetailResponse>(
        _accountDetailResponseBoxName,
      );
    } else {
      key = await secureManager.readKey();
      await Hive.openBox<AuthModel>(
        _authBoxName,
        encryptionCipher: HiveAesCipher(key),
      );
      await Hive.openBox<HomeResponse>(
        _homeResponseBoxName,
        encryptionCipher: HiveAesCipher(key),
      );
      await Hive.openBox<AccountDetailResponse>(
        _accountDetailResponseBoxName,
        encryptionCipher: HiveAesCipher(key),
      );
    }
  }

  Box<HomeResponse> get _getHomeResponseBox {
    return Hive.box<HomeResponse>(_homeResponseBoxName);
  }

  HomeResponse? getHomeResponseModel() {
    return _getHomeResponseBox.get(_homeResponseName);
  }

  void setHomeResponseModel(HomeResponse model) {
    _getHomeResponseBox.put(_homeResponseName, model);
  }

  Box<AccountDetailResponse> get _accountDetailResponseBox {
    return Hive.box<AccountDetailResponse>(_accountDetailResponseBoxName);
  }

  AccountDetailResponse? getAccountDetailResponseModel() {
    return _accountDetailResponseBox.get(_accountDetailResponseName);
  }

  void setAccountDetailResponseModel(AccountDetailResponse model) {
    _accountDetailResponseBox.put(_accountDetailResponseName, model);
  }

  Box<AuthModel> get _getAuthBox => Hive.box<AuthModel>(_authBoxName);

  @override
  AuthModel? get authModel => _getAuthBox.get(_authName);

  @override
  void signIn(AuthModel model) {
    _getAuthBox.put(_authName, model);
  }

  @override
  void signOut() {
    _getAuthBox.delete(_authName);
  }
}
