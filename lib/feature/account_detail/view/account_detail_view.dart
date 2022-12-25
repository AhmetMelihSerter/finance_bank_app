import 'package:finance_bank_app/core/base/view/base_view.dart';
import 'package:finance_bank_app/feature/account_detail/model/balance_chart_data.dart';
import 'package:finance_bank_app/feature/account_detail/service/account_detail_service.dart';
import 'package:finance_bank_app/feature/account_detail/view_model/account_detail_view_model.dart';
import 'package:finance_bank_app/product/components/app_bar/custom_app_bar.dart';
import 'package:finance_bank_app/product/components/drop_down_button/custom_drop_down_button.dart';
import 'package:finance_bank_app/product/components/list_tile/custom_list_tile.dart';
import 'package:finance_bank_app/product/constants/enums/product_enum.dart';
import 'package:finance_bank_app/product/init/network/dio_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AccountDetailView extends StatelessWidget {
  const AccountDetailView({super.key});

  String get _appBarTitle => 'Account Detail';

  String get _accountNumberTitle => 'Account Number';

  String get _remainingDebtTitle => 'Remaining Debt';

  String get _cutOffTitle => 'Cut-off date';

  String get _chartBalanceTitle => 'Balance';

  String get _cardActivitiesTitle => 'Activities';

  @override
  Widget build(BuildContext context) {
    return BaseView<AccountDetailViewModel>(
      viewModel: AccountDetailViewModel(
        AccountDetailService(DioManager.instance),
      ),
      onModelReady: (viewModel) {
        viewModel
          ..setContext(context)
          ..init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(),
        );
      },
    );
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      title: _appBarTitle,
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAccountDetail(),
          _buildChartTitle(),
          _buildChart(),
          _buildCardActivities(),
        ],
      ),
    );
  }

  Widget _buildAccountDetail() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        left: 40,
        right: 40,
      ),
      child: Consumer<AccountDetailViewModel>(
        builder: (context, viewModel, child) => Column(
          children: [
            _buildAccountTitle(
              _accountNumberTitle,
              viewModel.accountDetailModel?.accountNumber,
            ),
            _buildAccountTitle(
              _remainingDebtTitle,
              viewModel.accountDetailModel?.showRemainingDebt,
            ),
            _buildAccountTitle(
              _cutOffTitle,
              viewModel.accountDetailModel?.cutOffDate,
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildChartBalanceTitle(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildChartBalance(),
              _buildChartDropdown(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartBalanceTitle() {
    return Text(
      _chartBalanceTitle,
      style: const TextStyle(
        fontSize: 16,
        color: Color.fromRGBO(139, 152, 177, 1),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildChartBalance() {
    return Consumer<AccountDetailViewModel>(
      builder: (context, viewModel, child) => FadeInUp(
        child: Text(
          viewModel.accountDetailModel?.showBalance ?? '',
          style: const TextStyle(
            fontSize: 24,
            color: Color.fromRGBO(132, 56, 255, 1),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  CustomDropdownButton<Month> _buildChartDropdown() {
    return CustomDropdownButton<Month>(
      value: Month.october,
      items: [
        DropdownMenuItem(
          value: Month.october,
          child: Text(
            '${Month.october.shortName.toCapitalized()} - ${Month.february.shortName.toCapitalized()}',
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(96, 112, 143, 1),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChart() {
    final chartData = [
      BalanceChartData('Oct', 1100),
      BalanceChartData('Nov', 1500),
      BalanceChartData('Dec', 1400),
      BalanceChartData('Jan', 2000),
      BalanceChartData('Feb', 1750),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(
            width: 0,
          ),
        ),
        primaryYAxis: NumericAxis(
          isVisible: false,
        ),
        series: [
          AreaSeries<BalanceChartData, String>(
            dataSource: chartData,
            xValueMapper: (BalanceChartData data, _) => data.x,
            yValueMapper: (BalanceChartData data, _) => data.y,
            borderColor: const Color.fromRGBO(132, 56, 255, 1),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(132, 56, 255, 0.5),
                Color.fromRGBO(255, 255, 255, 0),
              ],
              stops: [
                0,
                1,
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAccountTitle(String title, String? value) {
    return FadeInLeft(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(139, 152, 177, 1),
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              value ?? '',
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(139, 152, 177, 1),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardActivities() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        bottom: 40,
      ),
      child: Column(
        children: [
          _buildRecentActivitiesTitle(),
          Consumer<AccountDetailViewModel>(
            builder: (context, viewModel, child) => FadeInUp(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: viewModel.cardActivities.length,
                itemBuilder: (context, index) =>
                    _buildListItem(viewModel, index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivitiesTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _cardActivitiesTitle,
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(96, 112, 143, 1),
              fontWeight: FontWeight.w700,
            ),
          ),
          Consumer<AccountDetailViewModel>(
            builder: (context, viewModel, child) => CustomDropdownButton<Month>(
              value: viewModel.selectedActivityMonth,
              onChanged: viewModel.setSelectedActivityMonth,
              items: [
                for (int i = 0; i < Month.values.length; i++)
                  DropdownMenuItem(
                    value: Month.values[i],
                    child: Text(
                      Month.values[i].name.toCapitalized(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(96, 112, 143, 1),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(AccountDetailViewModel viewModel, int index) {
    final item = viewModel.cardActivities[index];
    return CustomListTile(
      iconUrl: item.getIconUrl,
      title: item.title,
      subTitle: item.subTitle,
      trailing: item.showBalance,
    );
  }
}
