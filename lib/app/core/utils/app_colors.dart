import 'package:admin/app/core/utils/ui.dart';
import 'package:admin/app/services/initial_setting_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  static const Color whiteColor = Colors.white;
  static const Color errorColor = Colors.red;
  static const Color transparentColor = Colors.transparent;
  static const Color blackColor = Colors.black;
  static Color get shadowColor => UI.parseColor("#000000");
  static Color get secondaryColor => UI.parseColor(
      Get.find<InitialSettingServices>().settingmodel.lightTheme!.accentColor!);
  static Color get primaryColor =>
      UI.parseColor(Get.find<InitialSettingServices>()
          .settingmodel
          .lightTheme!
          .primaryColor!);
  static Color get hintColor => UI.parseColor(
      Get.find<InitialSettingServices>().settingmodel.lightTheme!.hintColor!);
  // static Color get bodyColor => UI.parseColor("#fef4ec");

  // static Color get darkOrange => UI.parseColor("#EF0E0E");
  // static Color get lightGreen => UI.parseColor("#1DBF73");
  static Color get greyColor => UI.parseColor("#919191");
  static Color get backColor => UI.parseColor("#212332");

  static Color get textColor => UI.parseColor(
      Get.find<InitialSettingServices>().settingmodel.lightTheme!.textColor!);

// static const Color achievementContBorderColor = Color(0xffFD6D00);
}
