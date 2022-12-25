import 'package:flutter/material.dart';

class ProductDecoration {
  static BoxShadow boxShadow = BoxShadow(
    color: Colors.black.withOpacity(0.16),
    spreadRadius: 1,
    blurRadius: 6,
    offset: const Offset(0, 3),
  );
  static BoxShadow boxShadow2 = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 1,
    blurRadius: 1,
    offset: const Offset(0, 3),
  );
  static BoxShadow boxShadowTop = BoxShadow(
    color: Colors.black.withOpacity(0.16),
    spreadRadius: 1,
    blurRadius: 3,
    offset: const Offset(0.5, 0),
  );

  static BoxShadow closestFuelStation = BoxShadow(
    color: Colors.grey.withOpacity(.3),
    spreadRadius: 1,
    blurRadius: 1,
  );
}
