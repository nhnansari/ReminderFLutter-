
import 'app_colors.dart';
import '../../responsive.dart';
import '../../services/initial_setting_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextstyle {
  // Base TextStyle
  static final textStyle = TextStyle(
    color: AppColors.textColor,
    fontFamily: Get.find<InitialSettingServices>().settingmodel.fontFamily,
    fontStyle: FontStyle.normal,
  );

  // Common Font Sizes
  static final TextStyle text24 = textStyle.copyWith(fontSize: 24);
  static final TextStyle text14 = textStyle.copyWith(fontSize: 14);

  static final TextStyle text13 = textStyle.copyWith(fontSize: 13);
  static final TextStyle text12 = textStyle.copyWith(fontSize: 12);

  // Even Numbers Font Sizes
  static final TextStyle text162 = textStyle.copyWith(fontSize: 52);
  static final TextStyle text30 = textStyle.copyWith(fontSize: 30);
  static final TextStyle text34 = textStyle.copyWith(fontSize: 34);
  static final TextStyle text36 = textStyle.copyWith(fontSize: 36);
  static final TextStyle text38 = textStyle.copyWith(fontSize: 38);
  static final TextStyle text40 = textStyle.copyWith(fontSize: 40);
  static final TextStyle text45 = textStyle.copyWith(fontSize: 45);
  static final TextStyle text16 = textStyle.copyWith(fontSize: 16);
  static final TextStyle text10 = textStyle.copyWith(fontSize: 10);
  static final TextStyle text8 = textStyle.copyWith(fontSize: 8);
  static final TextStyle text7 = textStyle.copyWith(fontSize: 7);
  static final TextStyle text6 = textStyle.copyWith(fontSize: 6);
  static final TextStyle text4 = textStyle.copyWith(fontSize: 4);
  static final TextStyle text3 = textStyle.copyWith(fontSize: 3);
  static final TextStyle text5 = textStyle.copyWith(fontSize: 5);

  static final TextStyle text118 = textStyle.copyWith(fontSize: 118);
  static final TextStyle text50 = textStyle.copyWith(fontSize: 50);
  static final TextStyle text72 = textStyle.copyWith(fontSize: 72);
  static final TextStyle text22 = textStyle.copyWith(fontSize: 22);
  static final TextStyle text20 = textStyle.copyWith(fontSize: 20);
  static final TextStyle text18 = textStyle.copyWith(fontSize: 18);
}

class FontSizeManager {
  static double getFontSize(BuildContext context, double fontSize) {
    if (Responsive.isMobile(context)) {
      return fontSize * 0.99; // Small screen (mobile)
    } else if (Responsive.isTablet(context)) {
      return fontSize * 1.1; // Medium screen (tablet)
    } else {
      return fontSize * 1.2; // Large screen (web)
    }
  }
}
