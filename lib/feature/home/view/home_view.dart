import 'package:finance_bank_app/core/base/view/base_view.dart';
import 'package:finance_bank_app/feature/home/service/home_service.dart';
import 'package:finance_bank_app/feature/home/view_model/home_view_model.dart';
import 'package:finance_bank_app/feature/settings/view/settings_view.dart';
import 'package:finance_bank_app/product/components/app_bar/custom_app_bar.dart';
import 'package:finance_bank_app/product/components/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:finance_bank_app/product/components/credit_card/custom_credit_card.dart';
import 'package:finance_bank_app/product/components/icon_button/custom_icon_button.dart';
import 'package:finance_bank_app/product/components/list_tile/custom_list_tile.dart';
import 'package:finance_bank_app/product/constants/enums/asset_enum.dart';
import 'package:finance_bank_app/product/init/network/dio_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

part 'home_sub_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(
        HomeService(DioManager.instance),
      ),
      onModelReady: (viewModel) {
        viewModel
          ..setContext(context)
          ..init();
      },
      onDispose: (model) => model.dispose(),
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          body: PageView.builder(
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            controller: viewModel.pageController,
            onPageChanged: viewModel.setCurrentPage,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildHomeBody(viewModel);
              } else {
                return const SettingsView();
              }
            },
          ),
          bottomNavigationBar: _buildBottomNavigationBar(),
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) => CustomBottomNavigationBar(
        currentIndex: viewModel.currentPage,
        onTap: viewModel.setCurrentPage,
      ),
    );
  }
}
