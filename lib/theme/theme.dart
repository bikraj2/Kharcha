import 'package:flutter/material.dart';
import 'color.dart';
import 'font.dart';

@immutable
class AppTheme {
  static const colors = AppColors();
  static var fonts = AppFonts();
  const AppTheme._();
  static ThemeData define() {
    return ThemeData(
      primaryColor: AppTheme.colors.basecolor,
      secondaryHeaderColor: AppTheme.colors.secondarycolor,
    );
  }
}
