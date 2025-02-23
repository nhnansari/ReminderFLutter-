import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_spaces.dart';
import '../../../core/utils/app_textstyle.dart';
import '../../../core/widgets/small_buttom.dart';
import '../controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        init: SettingController(),
        builder: (controller) => Title(
              title: "Setting",
              color: AppColors.secondaryColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: Column(
                  children: [
                    Text(
                      "Are you sure to logout for this compnay?",
                      style: AppTextstyle.text10.copyWith(
                          fontSize: FontSizeManager.getFontSize(context, 16)),
                    ),
                    height12,
                    SmallButton(
                      name: "Logout Company",
                      width: 200,
                      backcolor: AppColors.errorColor,
                      textColor: AppColors.whiteColor,
                      onclick: () {
                        controller.logout();
                      },
                    )
                  ],
                ),
              ),
            ));
  }
}
