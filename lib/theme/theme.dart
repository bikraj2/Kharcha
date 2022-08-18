import 'package:flutter/material.dart';
import 'color.dart';

@immutable
class AppTheme {
  static const colors = AppColors();
  const AppTheme._();
  static ThemeData define() {
    return ThemeData(
      fontFamily: 'SFRegular',
      primaryColor: AppTheme.colors.basecolor,
      secondaryHeaderColor: AppTheme.colors.secondarycolor,
    );
  }
}
