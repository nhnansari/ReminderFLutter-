// ignore_for_file: invalid_use_of_protected_member

import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/Custom_container.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/dotted_divider.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/screens/reminders/components/reply_reminder_dailog.dart';
import 'package:admin/app/screens/reminders/components/send_reminder_dialog.dart';
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
              child: Column(children: [
                Expanded(
                  child: InnerPadding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Reminders",
                                  style: AppTextstyle.text10.copyWith(
                                      fontSize: FontSizeManager.getFontSize(
                                          context, 18),
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold)),
                              if (controller.isWorker.value == "admin")
                                SmallButton(
                                    name: "Send Reminder",
                                    textColor: AppColors.whiteColor,
                                    backcolor: AppColors.secondaryColor,
                                    onclick: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              SendReminderDialog());
                                    })
                            ],
                          ),
                        ),
                        height18,
                        Expanded(
                          child: Obx(
                            () => (controller.reminders.isEmpty)
                                ? Center(
                                    child: Text(
                                      "No Reminders Found!",
                                      style: AppTextstyle.text10.copyWith(
                                        fontSize: FontSizeManager.getFontSize(
                                            context, 14),
                                        color: AppColors.backColor,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  )
                                : SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        controller.reminders
                                            .length, // Null check added
                                        (index) {
                                          final reminder =
                                              controller.reminders[index];
                                          return InkWell(
                                            onTap: () {},
                                            child: CustomContainer(
                                              borderColor: AppColors.backColor,
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              backColor: AppColors.whiteColor,
                                              child: InnerPadding(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Message",
                                                                style:
                                                                    AppTextstyle
                                                                        .text10
                                                                        .copyWith(
                                                                  fontSize: FontSizeManager
                                                                      .getFontSize(
                                                                          context,
                                                                          13),
                                                                  color: AppColors
                                                                      .textColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              Text(
                                                                reminder.reminderMessage!
                                                                        .message ??
                                                                    "No Message",
                                                                style:
                                                                    AppTextstyle
                                                                        .text10
                                                                        .copyWith(
                                                                  fontSize: FontSizeManager
                                                                      .getFontSize(
                                                                          context,
                                                                          11),
                                                                  color: AppColors
                                                                      .greyColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        IconButton(
                                                          onPressed: () async {
                                                            Get.dialog(
                                                                ReplyReminderDailog(
                                                              reminderData:
                                                                  reminder,
                                                            ));
                                                          },
                                                          icon: Icon(
                                                              Icons.reply,
                                                              color: AppColors
                                                                  .secondaryColor),
                                                        ),
                                                        if (controller.isWorker
                                                                .value ==
                                                            "admin") ...[
                                                          IconButton(
                                                            onPressed: () {
                                                              controller
                                                                  .deleteReminder(
                                                                      reminder
                                                                          .id);
                                                            },
                                                            icon: Icon(
                                                                Icons.delete,
                                                                color: AppColors
                                                                    .errorColor),
                                                          ),
                                                        ],
                                                      ],
                                                    ),
                                                    height6,
                                                    Text(
                                                      "Options",
                                                      style: AppTextstyle.text10
                                                          .copyWith(
                                                        fontSize:
                                                            FontSizeManager
                                                                .getFontSize(
                                                                    context,
                                                                    13),
                                                        color: AppColors
                                                            .secondaryColor,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                    // height12,
                                                    reminder.reminderMessage ==
                                                            null
                                                        ? Center(
                                                            child: Text(
                                                              "No Options Found!",
                                                              style:
                                                                  AppTextstyle
                                                                      .text10
                                                                      .copyWith(
                                                                fontSize: FontSizeManager
                                                                    .getFontSize(
                                                                        context,
                                                                        12),
                                                                color: AppColors
                                                                    .greyColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                            ),
                                                          )
                                                        : reminder.reminderMessage!
                                                                    .options ==
                                                                null
                                                            ? Center(
                                                                child: Text(
                                                                  "No Options Found!",
                                                                  style: AppTextstyle
                                                                      .text10
                                                                      .copyWith(
                                                                    fontSize: FontSizeManager
                                                                        .getFontSize(
                                                                            context,
                                                                            12),
                                                                    color: AppColors
                                                                        .greyColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                                ),
                                                              )
                                                            : Column(
                                                                children: List
                                                                    .generate(
                                                                  reminder
                                                                      .reminderMessage!
                                                                      .options!
                                                                      .length,
                                                                  (index1) =>
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            5),
                                                                    child: row(
                                                                        context:
                                                                            context,
                                                                        text: reminder
                                                                            .reminderMessage!
                                                                            .options![
                                                                                index1]
                                                                            .option,
                                                                        status: reminder
                                                                            .reminderMessage!
                                                                            .options![index1]
                                                                            .nature),
                                                                  ),
                                                                ),
                                                              ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ));
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
