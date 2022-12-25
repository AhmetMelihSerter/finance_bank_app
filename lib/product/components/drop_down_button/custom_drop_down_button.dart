import 'package:finance_bank_app/product/constants/enums/asset_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    this.width = 120,
    this.height = 60,
    this.items,
    this.value,
    this.onChanged,
  });

  final double height;

  final double width;

  final List<DropdownMenuItem<T>>? items;

  final T? value;

  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          onChanged: onChanged,
          items: items,
          icon: SvgPicture.asset(
            SvgAssets.bottomArrow.path,
          ),
        ),
      ),
    );
  }
}
