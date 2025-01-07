import 'package:flutter/material.dart';

class Constants {
  static const licenseNo = '13948944';
  static const groupId = '0';

  static const titleApp = "Support Center";

  /// Color
  static const primaryColor = Color.fromRGBO(37, 44, 126, 1); // #2b3493
  static const secondaryColor = Color.fromRGBO(99, 115, 129, 1); // #637381

  static Color textPrimaryColor({
    required double opacity,
  }) {
    return Color.fromRGBO(33, 43, 54, opacity); // #212B36
  }

  static Color textSecondaryColor({
    required double opacity,
  }) {
    return Color.fromRGBO(99, 115, 129, opacity); // #212B36
  }

  static Color grayColor({
    required double opacity,
  }) {
    return Color.fromRGBO(244, 246, 248, opacity);
  }

  static Color whiteColor({
    required double opacity,
  }) {
    return Color.fromRGBO(255, 255, 255, opacity); // #E9EAF4
  }

  static Color blackColor({
    required double opacity,
  }) {
    return Color.fromRGBO(33, 43, 54, opacity); // #212B36
  }

  /// Image Assets
  static const assetMyIcon = "assets/icons/my_icon.png";
  static const assetMyIcons = "assets/icons/my_icons.jpg";
  static const assetSplashLogo = "assets/image/servo_logo.gif";
}
