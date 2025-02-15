import "dart:convert" as convert;

import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_constant.dart';
import 'package:admin/app/core/utils/ui.dart';
import 'package:admin/app/initial_model/initial_setting_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';



class InitialSettingServices extends GetxService {
  late InitialSettingModel settingmodel;

  Future<InitialSettingServices> init() async {
    final response = await getjsonfile(kInitialSettingJson);
    if (response != null) {
      settingmodel = InitialSettingModel.fromJson(response);
    }
    return this;
  }

  static Future<dynamic> getjsonfile(String path) async {
    return rootBundle.loadString(path).then(convert.jsonDecode);
  }

  ThemeMode getthememode() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(systemNavigationBarColor: Colors.white));
    return ThemeMode.light;
  }

  ThemeData getLightTheme() {
    final lightTheme = settingmodel.lightTheme!;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: UI.parseColor(lightTheme.primaryColor!),
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: UI.parseColor(lightTheme.primaryColor!),
    ));
    return ThemeData(
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(100), // Makes the checkbox circular
        ),
      ),
      useMaterial3: true,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: UI.parseColor(lightTheme.accentColor!),
        selectionColor: UI.parseColor(lightTheme.primaryColor!),
        selectionHandleColor: UI.parseColor(lightTheme.primaryColor!),
      ),
      primaryColor: UI.parseColor(lightTheme.primaryColor!),
      primaryColorDark: UI.parseColor(lightTheme.primaryDarkColor!),
      brightness: Brightness.light,
      dividerColor: UI.parseColor(lightTheme.hintColor!),
      focusColor: UI.parseColor(lightTheme.accentColor!),
      hintColor: UI.parseColor(lightTheme.hintColor!),
      fontFamily: settingmodel.fontFamily,
      colorScheme: ColorScheme.light(
        primary: UI.parseColor(lightTheme.primaryColor!),
        secondary: UI.parseColor(lightTheme.accentColor!),
      ),
      scaffoldBackgroundColor: UI.parseColor(lightTheme.scaffoldColor!),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
