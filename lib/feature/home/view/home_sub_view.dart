part of 'home_view.dart';

String get _appBarTitle => 'Home';

String get _buildBalanceText => 'Balance';

String get _recentActivitiesTitle => 'Recent Activities';

String get _sendMoneyRichTextFirst => 'Send';
String get _sendMoneyRichTextSecond => 'Money';

String get _qrActionsRichTextFirst => 'QR';
String get _qrActionsRichTextSecond => 'Actions';

String get _payBillRichTextFirst => 'Pay';
String get _payBillRichTextSecond => 'Bill';

CustomAppBar _buildAppBar(HomeViewModel viewModel) {
  return CustomAppBar(
    leading: InkWell(
      onTap: viewModel.settingView,
      child: SvgPicture.asset(
        SvgAssets.settings.path,
      ),
    ),
    title: _appBarTitle,
    trailing: InkWell(
      onTap: viewModel.notificationView,
      child: SvgPicture.asset(
        SvgAssets.notification.path,
      ),
    ),
  );
}

Widget _buildHomeBody(HomeViewModel viewModel) {
  return Scaffold(
    appBar: _buildAppBar(viewModel),
    body: SingleChildScrollView(
      child: Column(
        children: [
          _buildCreditCard(),
          _buildActionButtons(viewModel),
          _buildRecentActivities(),
        ],
      ),
    ),
  );
}

Widget _buildCreditCard() {
  return Column(
    children: [
      Container(
        height: 160,
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) => ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.myCards.length,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            itemBuilder: (context, index) => _buildCardItem(viewModel, index),
          ),
        ),
      ),
      _buildCardDot(),
    ],
  );
}

Widget _buildCardItem(HomeViewModel viewModel, int index) {
  final item = viewModel.myCards[index];
  return FadeInRight(
    child: CustomCreditCard(
      onTap: () => viewModel.accountDetailView(index),
      balanceText: _buildBalanceText,
      amountText: item.showBalance,
      maskedPanText: item.cardNumber ?? '',
    ),
  );
}

Widget _buildCardDot() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          SvgAssets.dotUnSelected.path,
        ),
        const SizedBox(
          width: 5,
        ),
        SvgPicture.asset(
          SvgAssets.dotSelected.path,
        ),
        const SizedBox(
          width: 5,
        ),
        SvgPicture.asset(
          SvgAssets.dotUnSelected.path,
        ),
      ],
    ),
  );
}

Widget _buildActionButtons(HomeViewModel viewModel) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 40,
      right: 40,
      bottom: 40,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomIconButton(
          onTap: viewModel.sendMoney,
          richTextFirst: Text(
            _sendMoneyRichTextFirst,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          richTextSecond: Text(
            _sendMoneyRichTextSecond,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          child: SvgPicture.asset(
            SvgAssets.sendMoney.path,
          ),
        ),
        CustomIconButton(
          onTap: viewModel.qrActions,
          richTextFirst: Text(
            _qrActionsRichTextFirst,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          richTextSecond: Text(
            _qrActionsRichTextSecond,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          child: SvgPicture.asset(
            SvgAssets.qrActions.path,
          ),
        ),
        CustomIconButton(
          onTap: viewModel.payBill,
          richTextFirst: Text(
            _payBillRichTextFirst,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          richTextSecond: Text(
            _payBillRichTextSecond,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          child: SvgPicture.asset(
            SvgAssets.payBill.path,
          ),
        ),
      ],
    ),
  );
}

Widget _buildRecentActivities() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 40,
      right: 40,
      bottom: 40,
    ),
    child: Column(
      children: [
        _buildRecentActivitiesTitle(),
        Consumer<HomeViewModel>(
          builder: (context, viewModel, child) => FadeInUp(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: viewModel.recentActivities.length,
              itemBuilder: (context, index) => _buildListItem(viewModel, index),
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
          _recentActivitiesTitle,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        SvgPicture.asset(
          SvgAssets.rightArrow.path,
        ),
      ],
    ),
  );
}

Widget _buildListItem(HomeViewModel viewModel, int index) {
  final item = viewModel.recentActivities[index];
  return CustomListTile(
    iconUrl: item.getIconUrl,
    title: item.title,
    subTitle: item.subTitle,
    trailing: item.showBalance,
  );
}
