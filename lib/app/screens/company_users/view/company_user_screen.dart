import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/responsive_heading.dart';
import 'package:admin/app/screens/company_users/components/company_users.dart';
import 'package:admin/app/screens/company_users/components/invited_users.dart';
import 'package:admin/app/screens/company_users/controller/company_user_controller.dart';
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
                    textColor2: controller.headertext.value == 1
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                    textColor1: controller.headertext.value == 0
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                    dividerColor2: controller.headertext.value == 1
                        ? AppColors.primaryColor
                        : AppColors.transparentColor,
                    dividerColor1: controller.headertext.value == 0
                        ? AppColors.primaryColor
                        : AppColors.transparentColor,
                    ontap1: () {
                      controller.chnageIndex(0);
                    },
                    ontap2: () {
                      controller.chnageIndex(1);
                    },
                    child: controller.headertext.value == 0
                        ? CompanyUsers()
                        : InvitedUsers()),
              ),
            )));
  }
}
