import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/InnerPadding.dart';
import '../../../core/widgets/responsive_heading.dart';
import '../components/company_users.dart';
import '../components/invited_users.dart';
import '../controller/company_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyUserScreen extends GetView<CompanyUserController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyUserController>(
        init: CompanyUserController(),
        builder: (controller) => Title(
            color: AppColors.primaryColor,
            title: "Employees",
            child: InnerPadding(
              child: Obx(
                () => ResponsiveHeading(
                    text1: "Company Users",
                    text2: "Invited Users",
                    textColor2: controller.headerText.value == 1
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                    textColor1: controller.headerText.value == 0
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                    dividerColor2: controller.headerText.value == 1
                        ? AppColors.primaryColor
                        : AppColors.transparentColor,
                    dividerColor1: controller.headerText.value == 0
                        ? AppColors.primaryColor
                        : AppColors.transparentColor,
                    ontap1: () {
                      controller.changeHeaderIndex(0);
                    },
                    ontap2: () {
                      controller.changeHeaderIndex(1);
                    },
                    child:
                    controller.headerText.value == 0
                        ? CompanyUsers()
                        :
                    InvitedUsers()),
              ),
            )));
  }
}
