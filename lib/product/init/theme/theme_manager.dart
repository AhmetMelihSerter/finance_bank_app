import 'package:finance_bank_app/core/init/theme/i_theme_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager extends IThemeManager {
  ThemeManager._internal();

  static ThemeManager? _instance;

  static ThemeManager get instance => _instance ??= ThemeManager._internal();

  String get _fontFamily => 'NeutrifPro';

  Color get _appBarColor => const Color.fromRGBO(96, 112, 143, 1);

  Color get _bottomNavigationSelectedColor =>
      const Color.fromRGBO(56, 124, 255, 1);

  Color get _inputDecorationFillColor => const Color.fromRGBO(249, 250, 251, 1);
  Color get _inputDecorationBorderColor =>
      const Color.fromRGBO(215, 220, 228, 1);

  @override
  ThemeData get theme {
    return ThemeData(
      fontFamily: _fontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: _appBarColor,
        ),
        titleTextStyle: TextStyle(
          color: _appBarColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        actionsIconTheme: IconThemeData(
          color: _appBarColor,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: _bottomNavigationSelectedColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _inputDecorationFillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: _inputDecorationBorderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: _inputDecorationBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: _inputDecorationBorderColor,
          ),
        ),
      ),
    );
  }
}
