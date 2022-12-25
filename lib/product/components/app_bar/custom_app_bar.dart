import 'package:finance_bank_app/product/constants/enums/asset_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leading,
    required this.title,
    this.trailing,
  });

  final Widget? leading;
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (leading != null) ...[
                leading!,
              ] else if (ModalRoute.of(context)!.canPop) ...[
                InkWell(
                  onTap: context.navigation.pop,
                  child: SvgPicture.asset(
                    SvgAssets.backArrow.path,
                  ),
                ),
              ] else ...[
                const SizedBox(
                  width: 50,
                ),
              ],
              Text(title),
              trailing ??
                  const SizedBox(
                    width: 50,
                  ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, kToolbarHeight + 8);
}
