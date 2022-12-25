// ignore_for_file: always_use_package_imports

import 'package:flutter/material.dart';

import '../../../product/init/logger/logger_manager.dart';
import '../../../product/init/storage/hive_manager.dart';
import '../../constants/enums/app_enum.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BaseViewModel() {
    logger.info('${runtimeType.toString()} initialize');
  }

  late BuildContext viewModelContext;

  final LoggerManager logger = LoggerManager.instance;

  final HiveManager localManager = HiveManager.instance;

  void setContext(BuildContext context);
  void init();

  ViewState _viewState = ViewState.idle;

  ViewState get viewState => _viewState;

  void setViewState(ViewState value) {
    _viewState = value;
    notifyListeners();
  }
}
