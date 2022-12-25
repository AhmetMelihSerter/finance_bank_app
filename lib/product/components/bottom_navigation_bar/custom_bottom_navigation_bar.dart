import 'package:finance_bank_app/product/constants/enums/asset_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int>? onTap;

  Color get _activeColor => const Color.fromRGBO(56, 124, 255, 1);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: SvgPicture.asset(
            SvgAssets.homeNav.path,
            color: currentIndex == 0 ? _activeColor : null,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: SvgPicture.asset(
            SvgAssets.walletNav.path,
            color: currentIndex == 1 ? _activeColor : null,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: SvgPicture.asset(
            SvgAssets.chartNav.path,
            color: currentIndex == 2 ? _activeColor : null,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: SvgPicture.asset(
            SvgAssets.profileNav.path,
            color: currentIndex == 3 ? _activeColor : null,
          ),
        ),
      ],
    );
  }
}
