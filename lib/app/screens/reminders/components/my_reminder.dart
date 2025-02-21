import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_spaces.dart';
import '../../../core/utils/app_textstyle.dart';
import '../../../core/widgets/Custom_container.dart';
import '../../../core/widgets/InnerPadding.dart';
import '../../../core/widgets/small_buttom.dart';
import 'reply_reminder_dailog.dart';
import 'send_reminder_dialog.dart';
import '../controller/reminder_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyReminder extends StatelessWidget {
  final controller = Get.put(ReminderController());
  MyReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                          fontSize: FontSizeManager.getFontSize(context, 18),
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
                              builder: (context) => SendReminderDialog());
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
                            fontSize: FontSizeManager.getFontSize(context, 14),
                            color: AppColors.backColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            controller.reminders.length, // Null check added
                            (index) {
                              final reminder = controller.reminders[index];
                              return InkWell(
                                onTap: () {},
                                child: CustomContainer(
                                  borderColor: AppColors.backColor,
                                  margin: EdgeInsets.only(bottom: 10),
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Message",
                                                    style: AppTextstyle.text10
                                                        .copyWith(
                                                      fontSize: FontSizeManager
                                                          .getFontSize(
                                                              context, 13),
                                                      color:
                                                          AppColors.textColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    reminder.reminderMessage!
                                                            .message ??
                                                        "No Message",
                                                    style: AppTextstyle.text10
                                                        .copyWith(
                                                      fontSize: FontSizeManager
                                                          .getFontSize(
                                                              context, 11),
                                                      color:
                                                          AppColors.greyColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (controller.isWorker.value ==
                                                "admin") ...[
                                              IconButton(
                                                onPressed: () {
                                                  controller.deleteReminder(
                                                      reminder.id);
                                                },
                                                icon: Icon(Icons.delete,
                                                    color:
                                                        AppColors.errorColor),
                                              ),
                                            ],
                                          ],
                                        ),
                                        height6,
                                        Text(
                                          "Options",
                                          style: AppTextstyle.text10.copyWith(
                                            fontSize:
                                                FontSizeManager.getFontSize(
                                                    context, 13),
                                            color: AppColors.secondaryColor,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        height12,
                                        reminder.reminderMessage == null
                                            ? Center(
                                                child: Text(
                                                  "No Options Found!",
                                                  style: AppTextstyle.text10
                                                      .copyWith(
                                                    fontSize: FontSizeManager
                                                        .getFontSize(
                                                            context, 12),
                                                    color: AppColors.greyColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              )
                                            : reminder.reminderMessage!
                                                        .options ==
                                                    null
                                                ? Center(
                                                    child: Text(
                                                      "No Options Found!",
                                                      style: AppTextstyle.text10
                                                          .copyWith(
                                                        fontSize:
                                                            FontSizeManager
                                                                .getFontSize(
                                                                    context,
                                                                    12),
                                                        color:
                                                            AppColors.greyColor,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  )
                                                : Row(
                                                    children: [
                                                      Expanded(
                                                        child: Wrap(
                                                            children:
                                                                List.generate(
                                                          reminder
                                                              .reminderMessage!
                                                              .options!
                                                              .length,
                                                          (index1) => InkWell(
                                                            onTap: () {},
                                                            child:
                                                                CustomContainer(
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            5,
                                                                        bottom:
                                                                            9),
                                                                    backColor:
                                                                        AppColors
                                                                            .whiteColor,
                                                                    borderColor:
                                                                        AppColors
                                                                            .primaryColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              8,
                                                                          vertical:
                                                                              5),
                                                                      child:
                                                                          Text(
                                                                        reminder
                                                                            .reminderMessage!
                                                                            .options![index1]
                                                                            .option
                                                                            .toString(),
                                                                        style: AppTextstyle
                                                                            .text10
                                                                            .copyWith(
                                                                          fontSize: FontSizeManager.getFontSize(
                                                                              context,
                                                                              12),
                                                                          color:
                                                                              AppColors.textColor,
                                                                        ),
                                                                      ),
                                                                    )),
                                                          ),
                                                        )),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      SmallButton(
                                                        name: "Reply",
                                                        textColor: AppColors
                                                            .secondaryColor,
                                                        backcolor: AppColors
                                                            .whiteColor,
                                                        borderColor: AppColors
                                                            .primaryColor,
                                                        onclick: () {
                                                          Get.dialog(
                                                              ReplyReminderDailog(
                                                            reminderData:
                                                                reminder,
                                                          ));
                                                        },
                                                      )
                                                    ],
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
    );
  }
}
