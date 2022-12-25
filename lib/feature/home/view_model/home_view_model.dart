import 'package:finance_bank_app/core/base/view_model/base_view_model.dart';
import 'package:finance_bank_app/core/constants/enums/app_enum.dart';
import 'package:finance_bank_app/feature/home/model/my_card.dart';
import 'package:finance_bank_app/feature/home/model/recent_activity.dart';
import 'package:finance_bank_app/feature/home/service/i_home_service.dart';
import 'package:finance_bank_app/product/constants/navigation/navigation_constants.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel(this._service);

  final IHomeService _service;

  late final PageController pageController;

  List<MyCard> _myCards = [];

  List<MyCard> get myCards => _myCards;

  List<RecentActivity> _recentActivities = [];

  List<RecentActivity> get recentActivities => _recentActivities;

  int _currentPage = 0;

  int get currentPage => _currentPage;

  void setCurrentPage(int value) {
    _currentPage = value;
    pageController.jumpToPage(value);
    notifyListeners();
    _futureInitialize();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    pageController = PageController();
    Future.microtask(() async {
      await _futureInitialize();
    });
  }

  void onDispose() {
    pageController.dispose();
  }

  Future<void> _futureInitialize() async {
    try {
      setViewState(ViewState.busy);
      final responseModel = await _service.getHome();

      _myCards = responseModel?.myCards ?? [];

      _recentActivities = responseModel?.recentActivities ?? [];
    } catch (e) {
      logger.error('Error: $e');
    } finally {
      setViewState(ViewState.idle);
    }
  }

  void settingView() {
    setCurrentPage(3);
  }

  void notificationView() {}

  void payBill() {}

  void qrActions() {}

  void sendMoney() {}

  void accountDetailView(int index) {
    viewModelContext.navigateName(
      NavigationConstants.accountDetailRoute,
      data: index,
    );
  }
}
