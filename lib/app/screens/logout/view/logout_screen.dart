import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/screens/logout/controller/logout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutScreen extends GetView<LogoutController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogoutController>(
        init: LogoutController(),
        builder: (controller) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Column(
                children: [
                  Text(
                    "Are you sure to logout?",
                    style: AppTextstyle.text10.copyWith(
                        fontSize: FontSizeManager.getFontSize(context, 16)),
                  ),
                  height12,
                  SmallButton(
                    name: "Logout",
                    width: 150,
                    backcolor: AppColors.errorColor,
                    textColor: AppColors.whiteColor,
                    onclick: () {
                      controller.logout();
                    },
                  )
                ],
              ),
            ));
  }
}
