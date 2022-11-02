import 'package:flutter/material.dart';

class AppColors {
  static const Color purpleColor = Color(0xff5843BE);
  static const Color orangeColor = Color(0xffFF9376);
  static const Color blackColor = Color(0xff000000);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color greyColor = Color(0xff82868E);

  //http://mcg.mbitson.com/#!?colormap=%23fdb915&themename=colormap
  static const MaterialColor primarySwatch = MaterialColor(colorPrimaryMaterial, <int, Color>{
    50: Color(0xFFEBE8F7),
    100: Color(0xFFCDC7EC),
    200: Color(0xFFACA1DF),
    300: Color(0xFF8A7BD2),
    400: Color(0xFF715FC8),
    500: Color(colorPrimaryMaterial),
    600: Color(0xFF503DB8),
    700: Color(0xFF4734AF),
    800: Color(0xFF3D2CA7),
    900: Color(0xFF2D1E99),
  });

  static const int colorPrimaryMaterial = 0xFF5843BE;
}
