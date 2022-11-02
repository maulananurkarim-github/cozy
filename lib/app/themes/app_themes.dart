import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_utils.dart';

class AppThemes {
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: GoogleFonts.poppins().fontFamily,
    primarySwatch: AppColors.primarySwatch,
    elevatedButtonTheme: elevatedButtonTheme,
  );

  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0.0),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.radiusLarge,
          ),
        ),
      ),
      textStyle: MaterialStateProperty.all(
        TextStyle(
          fontSize: AppDimensions.fontSizeExtraLarge,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
