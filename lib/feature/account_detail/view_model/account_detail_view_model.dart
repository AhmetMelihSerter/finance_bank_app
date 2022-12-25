import 'package:finance_bank_app/core/base/view_model/base_view_model.dart';
import 'package:finance_bank_app/core/constants/enums/app_enum.dart';
import 'package:finance_bank_app/feature/account_detail/model/account_detail_model.dart';
import 'package:finance_bank_app/feature/account_detail/model/card_activity.dart';
import 'package:finance_bank_app/feature/account_detail/service/i_account_detail_service.dart';
import 'package:finance_bank_app/product/constants/enums/product_enum.dart';
import 'package:flutter/material.dart';

class AccountDetailViewModel extends BaseViewModel {
  AccountDetailViewModel(this._service);

  final IAccountDetailService _service;

  late final int _index;

  AccountDetailModel? _accountDetailModel;

  AccountDetailModel? get accountDetailModel => _accountDetailModel;

  List<CardActivity> _cardActivities = [];

  List<CardActivity> get cardActivities => _cardActivities
      .where(
        (element) => element.getMonth == _selectedActivityMonth,
      )
      .toList();

  final List<Month> _monthList = Month.values.toList();

  List<Month> get monthList => _monthList;

  Month _selectedActivityMonth = Month.january;

  Month get selectedActivityMonth => _selectedActivityMonth;

  void setSelectedActivityMonth(Month? value) {
    if (value == null) {
      return;
    }
    _selectedActivityMonth = value;
    notifyListeners();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _index = (ModalRoute.of(viewModelContext)!.settings.arguments as int?) ?? 1;
    Future.microtask(() async {
      await _futureInitialize();
    });
  }

  Future<void> _futureInitialize() async {
    try {
      setViewState(ViewState.busy);
      final responseModel = await _service.accountDetailById(_index);

      _accountDetailModel = responseModel?.accountDetail;
      _cardActivities = responseModel?.activities ?? [];
    } catch (e) {
      logger.error('Error: $e');
    } finally {
      setViewState(ViewState.idle);
    }
  }
}
