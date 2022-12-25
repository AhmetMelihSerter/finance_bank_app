import 'package:finance_bank_app/product/constants/enums/asset_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCreditCard extends StatelessWidget {
  const CustomCreditCard({
    super.key,
    this.cardColor,
    required this.balanceText,
    this.balanceStyle,
    required this.amountText,
    this.amountStyle,
    required this.maskedPanText,
    this.maskedPanStyle,
    this.width = 300,
    this.radius = 30,
    this.onTap,
  });

  final double width;
  final VoidCallback? onTap;
  final double radius;
  final Color? cardColor;
  final String balanceText;
  final TextStyle? balanceStyle;
  final String amountText;
  final TextStyle? amountStyle;
  final String maskedPanText;
  final TextStyle? maskedPanStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: cardColor ?? const Color.fromRGBO(132, 56, 255, 1),
          borderRadius: BorderRadius.circular(radius),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 1),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      balanceText,
                      style: const TextStyle(
                        color: Color.fromRGBO(220, 199, 255, 1),
                        fontSize: 16,
                      ).merge(balanceStyle),
                    ),
                    SvgPicture.asset(
                      SvgAssets.creditCardLogo.path,
                    ),
                  ],
                ),
                Text(
                  amountText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ).merge(amountStyle),
                ),
              ],
            ),
            Text(
              maskedPanText,
              style: const TextStyle(
                color: Color.fromRGBO(220, 199, 255, 1),
                fontSize: 16,
              ).merge(maskedPanStyle),
            ),
          ],
        ),
      ),
    );
  }
}
