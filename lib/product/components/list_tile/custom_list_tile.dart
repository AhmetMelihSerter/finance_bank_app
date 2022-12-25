import 'package:finance_bank_app/product/components/icon_button/custom_icon_button.dart';
import 'package:finance_bank_app/product/constants/enums/asset_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.title,
    this.iconUrl,
    this.titleStyle,
    this.subTitle,
    this.subTitleStyle,
    this.trailing,
    this.trailingStyle,
  });

  final String? title;
  final SvgAssets? iconUrl;
  final TextStyle? titleStyle;
  final String? subTitle;
  final TextStyle? subTitleStyle;
  final String? trailing;
  final TextStyle? trailingStyle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomIconButton(
        width: 50,
        height: 50,
        padding: 8,
        child: SvgPicture.asset(
          (iconUrl ?? SvgAssets.netflix).path,
        ),
      ),
      title: Text(
        title ?? '',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ).merge(titleStyle),
      ),
      subtitle: Text(
        subTitle ?? '',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(215, 220, 228, 1),
        ).merge(subTitleStyle),
      ),
      trailing: Text(
        trailing ?? '',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(96, 112, 143, 1),
        ).merge(trailingStyle),
      ),
    );
  }
}
