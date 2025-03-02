import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData data(bool isDark) {
    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: GoogleFonts.roboto().fontFamily,
      splashFactory: InkRipple.splashFactory,
      scaffoldBackgroundColor: isDark ? Colors.black : Colors.white,
    );
  }
}
