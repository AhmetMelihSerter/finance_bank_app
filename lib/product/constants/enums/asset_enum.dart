enum SvgAssets {
  settings,
  notification,
  payBill,
  qrActions,
  sendMoney,
  rightArrow,
  netflix,
  turkcell,
  backArrow,
  bottomArrow,
  homeNav,
  walletNav,
  chartNav,
  profileNav,
  search,
  profilePersonal,
  profileMessages,
  preferencesProduct,
  preferencesNotification,
  preferencesQr,
  otherDefinition,
  creditCardLogo,
  dotSelected,
  dotUnSelected;

  String get path {
    switch (this) {
      case SvgAssets.netflix:
        return 'assets/logos/logo_netflix.svg';
      case SvgAssets.turkcell:
        return 'assets/logos/logo_turkcell.svg';
      case SvgAssets.creditCardLogo:
        return 'assets/logos/logo_credit_card.svg';
      case SvgAssets.dotSelected:
        return 'assets/icons/ic_dot_selected.svg';
      case SvgAssets.dotUnSelected:
        return 'assets/icons/ic_dot_unselected.svg';
      case SvgAssets.settings:
        return 'assets/icons/ic_settings.svg';
      case SvgAssets.notification:
        return 'assets/icons/ic_notification.svg';
      case SvgAssets.payBill:
        return 'assets/icons/ic_pay_bill.svg';
      case SvgAssets.qrActions:
        return 'assets/icons/ic_qr_actions.svg';
      case SvgAssets.sendMoney:
        return 'assets/icons/ic_send_money.svg';
      case SvgAssets.rightArrow:
        return 'assets/icons/ic_right_arrow.svg';
      case SvgAssets.backArrow:
        return 'assets/icons/ic_back_arrow.svg';
      case SvgAssets.bottomArrow:
        return 'assets/icons/ic_bottom_arrow.svg';
      case SvgAssets.homeNav:
        return 'assets/icons/ic_home_nav.svg';
      case SvgAssets.walletNav:
        return 'assets/icons/ic_wallet_nav.svg';
      case SvgAssets.chartNav:
        return 'assets/icons/ic_chart_nav.svg';
      case SvgAssets.profileNav:
        return 'assets/icons/ic_profile_nav.svg';
      case SvgAssets.search:
        return 'assets/icons/ic_search.svg';
      case SvgAssets.profilePersonal:
        return 'assets/icons/ic_profile_personal.svg';
      case SvgAssets.profileMessages:
        return 'assets/icons/ic_profile_messages.svg';
      case SvgAssets.preferencesProduct:
        return 'assets/icons/ic_preferences_product.svg';
      case SvgAssets.preferencesNotification:
        return 'assets/icons/ic_preferences_notification.svg';
      case SvgAssets.preferencesQr:
        return 'assets/icons/ic_preferences_qr.svg';
      case SvgAssets.otherDefinition:
        return 'assets/icons/ic_profile_messages.svg';
    }
  }
}
