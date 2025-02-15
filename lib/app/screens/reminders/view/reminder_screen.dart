// ignore_for_file: invalid_use_of_protected_member

import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/dotted_divider.dart';
import 'package:admin/app/core/widgets/responsive_heading.dart';
import 'package:admin/app/screens/reminders/components/my_reminder.dart';
import 'package:admin/app/screens/reminders/components/reminder_reply.dart';
import 'package:admin/app/screens/reminders/controller/reminder_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReminderScreen extends GetView<ReminderController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReminderController>(
        init: ReminderController(),
        builder: (controller) => Title(
            color: AppColors.primaryColor,
            title: "Reminders",
            child: InnerPadding(
              child: Obx(
                () => ResponsiveHeading(
                    text1: "My Reminders",
                    text2: controller.isWorker.value == "admin"
                        ? "Reminders Reply"
                        : "",
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
                      controller.chnageHeaderIndex(0);
                    },
                    ontap2: () {
                      controller.chnageHeaderIndex(1);
                    },
                    child: controller.headertext.value == 0
                        ? MyReminder()
                        : controller.isWorker.value == "admin"
                            ? ReminderReply()
                            : SizedBox()),
              ),
            )));
  }
}

Widget row({text, status, context}) {
  return Row(
    children: [
      Text(text,
          style: AppTextstyle.text10.copyWith(
            fontSize: FontSizeManager.getFontSize(context, 11),
            color: AppColors.greyColor,
          )),
      width4,
      Expanded(
        child: DottedDivider(
          color: AppColors.greyColor, // Use your existing AppColors
          height: 1.0, // Adjust thickness
          dashWidth: 5.0, // Width of each dash
          dashSpace: 4.0, // Space between dashes
        ),
      ),
      width4,
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.backColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          status,
          style: AppTextstyle.text10.copyWith(
            fontSize: FontSizeManager.getFontSize(context, 12),
            color: AppColors.textColor,
          ),
        ),
      ),
    ],
  );
}
