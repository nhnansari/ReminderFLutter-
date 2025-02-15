// ignore_for_file: deprecated_member_use


import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UI {
  static Color parseColor(String hexCode, {double? opacity}) {
    try {
      return Color(int.parse(hexCode.replaceAll("#", "0xFF")))
          .withOpacity(opacity ?? 1);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity ?? 1);
    }
  }

  /// Success SnackBar
  static successSnackBar(
      {String title = 'Success',
      String? message,
      double? maxWidth,
      int? seconds = 1,
      SnackPosition snackPosition = SnackPosition.BOTTOM}) {
    if (!Get.isSnackbarOpen) {
      Get.showSnackbar(
        _successSnackBar(
          message: message,
        ),
      );
    }
  }

  static GetSnackBar _successSnackBar(
      {String title = 'Success',
      String? message,
      double? maxWidth,
      int? seconds = 1,
      SnackPosition snackPosition = SnackPosition.BOTTOM}) {
    return GetSnackBar(
      titleText: Text(
        title.tr,
        // style: Get.textTheme.headline4!.copyWith(
        //     color: AppColors.whiteColor, fontWeight: FontWeight.w600)
      ),
      messageText: Text(
        message!,
        // style: Get.textTheme.headline3!.copyWith(
        //     color: AppColors.whiteColor, fontWeight: FontWeight.w400)
      ),
      snackPosition: snackPosition,
      maxWidth: maxWidth,
      margin: const EdgeInsets.all(20),
      backgroundColor: AppColors.primaryColor,
      icon: const Icon(Icons.check_circle_outline,
          size: 32, color: AppColors.whiteColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      dismissDirection: DismissDirection.horizontal,
      duration: Duration(seconds: seconds!),
    );
  }

  /// Error SnackBar
  static errorSnackBar(
      {String title = 'Error', String? message, double? maxWidth}) {
    if (!Get.isSnackbarOpen) {
      Get.showSnackbar(
        _errorSnackBar(
          message: message,
        ),
      );
    }
  }

  static GetSnackBar _errorSnackBar(
      {String title = 'Error', String? message, double? maxWidth}) {
    if (message!.contains('Exception:')) {
      message = message.replaceAll("Exception:", "");
    }
    return GetSnackBar(
      titleText: Text(
        title.tr,
        // style: Get.textTheme.headline4!.copyWith(
        //     color: AppColors.whiteColor, fontWeight: FontWeight.w600)
      ),
      messageText: Text(
        message.trim(),
        // style: Get.textTheme.headline3!
        //     .copyWith(color: AppColors.whiteColor, fontWeight: FontWeight.w400),
        maxLines: 2,
      ),
      snackPosition: SnackPosition.BOTTOM,
      maxWidth: maxWidth,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.redAccent,
      icon: const Icon(Icons.remove_circle_outline,
          size: 32, color: AppColors.whiteColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }

  /// Alert SnackBar
  static alertSnackBar(
      {String title = 'Alert', String? message, double? maxWidth}) {
    if (!Get.isSnackbarOpen) {
      Get.showSnackbar(
        _alertSnackBar(
          message: message,
        ),
      );
    }
  }

  static GetSnackBar _alertSnackBar(
      {String title = 'Alert',
      String? message,
      double? maxWidth,
      Duration? duration = const Duration(seconds: 1)}) {
    return GetSnackBar(
      titleText: Text(
        title.tr,
        // style: Get.textTheme.headline4!.copyWith(
        //     color: AppColors.whiteColor, fontWeight: FontWeight.w600)
      ),
      messageText: Text(
        message!,
        // style: Get.textTheme.headline3!.copyWith(
        //     color: AppColors.whiteColor, fontWeight: FontWeight.w400)
      ),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      maxWidth: maxWidth,
      backgroundColor: Colors.blueAccent,
      icon: const Icon(Icons.add_alert_outlined,
          size: 32, color: AppColors.whiteColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: duration!,
    );
  }

  static closeSnackBar() {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
  }
}
