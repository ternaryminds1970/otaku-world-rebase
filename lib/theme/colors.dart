import 'package:flutter/material.dart';

class AppColors {
  static const Color sunsetOrange = Color(0xFFFF5757);
  static const Color congoPink = Color(0xFFFF8A80);
  static const Color japaneseIndigo = Color(0xFF263749);
  static const Color crayola = Color(0xFFF2C94C);
  static const Color kiwi = Color(0xFF81F24C);
  static const Color gold = Color(0xFFFFD700);
  static const Color silver = Color(0xFFBEBEBE);
  static const Color bronze = Color(0xFFCD7F32);
  static const Color maxRed = Color(0xFFDB1E1E);
  static const Color white = Color(0xFFFFFFFF);
  static const Color raisinBlack = Color(0xFF202020);
  static const Color darkCharcoal = Color(0xFF303030);
  static const Color jet = Color(0xFF353535);
  static const Color blackOlive = Color(0xFF404040);
  static const Color graniteGray = Color(0xFF606060);
  static const Color htmlGray = Color(0xFF808080);
  static const Color darkGray = Color(0xFFAAAAAA);
  static const Color americanSilver = Color(0xFFD0D0D0);
  static const Color chineseWhite = Color(0xFFE0E0E0);
  static const Color black = Color(0xFF000000);
  static const Color chineseBlack = Color(0xFF151515);
  static const Color blackShadow = Color(0x3F000000);
  static const Color transparent = Colors.transparent;
  static const Color lightSilver = Color(0xFFD9D9D9);
  static const Color darkMagenta = Color(0xFF8E009A);
  static const Color trueBlue = Color(0xFF006FE4);
  static const Color linkColor = Color(0xff02A9FF);

  // Media list status colors
  static const Color toolBox = Color(0xFF6A68C5);
  static const Color americanGreen = Color(0xFF34B53A);
  static const Color pantonePink = Color(0xFFD74B8E);
  static const Color deepLemon = Color(0xFFF6C619);
  static const Color quickSilver = Color(0xFFAAA3A3);
  static const Color mangoTango = Color(0xFFF87F3C);

  static const Color brilliantAzure = Color(0x3332A6F9);

  static const primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      sunsetOrange,
      japaneseIndigo,
    ],
  );

  static const chartGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      japaneseIndigo,
    ],
  );

  static const secondaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.japaneseIndigo,
      AppColors.darkCharcoal,
    ],
  );

  static const secondaryGradientHorizontal = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [
      AppColors.japaneseIndigo,
      AppColors.raisinBlack,
    ],
  );
}
