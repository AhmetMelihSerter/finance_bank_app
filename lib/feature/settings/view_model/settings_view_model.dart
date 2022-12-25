import 'package:finance_bank_app/core/base/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

class SettingsViewModel extends BaseViewModel {

  String _search = '';

  String get search => _search;

  void setSearch(String? value) {
    if (value == null) {
      return;
    }
    _search = value;
    notifyListeners();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
  }
}
