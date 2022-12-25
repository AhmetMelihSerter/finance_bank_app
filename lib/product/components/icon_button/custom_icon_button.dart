import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.width = 60,
    this.height = 60,
    this.radius = 14,
    this.padding = 16,
    this.onTap,
    this.child,
    this.richTextFirst,
    this.richTextSecond,
  });

  final double width;
  final double height;
  final double radius;
  final double padding;
  final VoidCallback? onTap;
  final Widget? child;
  final Widget? richTextFirst;
  final Widget? richTextSecond;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: width,
            height: height,
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: const Color.fromRGBO(240, 241, 245, 1),
            ),
            child: child,
          ),
        ),
        if (richTextFirst != null) ...[
          const SizedBox(
            height: 10,
          ),
          richTextFirst!,
        ],
        if (richTextSecond != null) ...[
          richTextSecond!,
        ],
      ],
    );
  }
}
