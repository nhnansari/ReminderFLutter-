import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/Custom_container.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/screens/reminders/controller/reminder_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReminderReply extends StatelessWidget {
  final controller = Get.find<ReminderController>();
  ReminderReply({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InnerPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Comapny Reminders",
                style: AppTextstyle.text10.copyWith(
                    fontSize: FontSizeManager.getFontSize(context, 18),
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold)),
            height18,
            Expanded(
              child: Obx(
                () => (controller.reminderReply.isEmpty)
                    ? Center(
                        child: Text(
                          "No Company Reminders Found!",
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
                            controller.reminderReply.length, // Null check added
                            (index) {
                              final reminder = controller.reminderReply[index];
                              return CustomContainer(
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
                                                            context, 14),
                                                    color: AppColors.textColor,
                                                    fontWeight: FontWeight.bold,
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
                                                            context, 12),
                                                    color: AppColors.greyColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Worker",
                                                style: AppTextstyle.text10
                                                    .copyWith(
                                                  fontSize: FontSizeManager
                                                      .getFontSize(context, 14),
                                                  color: AppColors.textColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                reminder.workers!.fullName ??
                                                    "No Name",
                                                style: AppTextstyle.text10
                                                    .copyWith(
                                                  fontSize: FontSizeManager
                                                      .getFontSize(context, 12),
                                                  color: AppColors.greyColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      height6,
                                      Text(
                                        "Options:",
                                        style: AppTextstyle.text10.copyWith(
                                          fontSize: FontSizeManager.getFontSize(
                                              context, 13),
                                          color: AppColors.secondaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      height6,
                                      reminder.reminderMessage == null
                                          ? Center(
                                              child: Text(
                                                "No Options Found!",
                                                style: AppTextstyle.text10
                                                    .copyWith(
                                                  fontSize: FontSizeManager
                                                      .getFontSize(context, 12),
                                                  color: AppColors.greyColor,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            )
                                          : reminder.reminderMessage!.options ==
                                                  null
                                              ? Center(
                                                  child: Text(
                                                    "No Options Found!",
                                                    style: AppTextstyle.text10
                                                        .copyWith(
                                                      fontSize: FontSizeManager
                                                          .getFontSize(
                                                              context, 12),
                                                      color:
                                                          AppColors.greyColor,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                )
                                              : Wrap(
                                                  children: List.generate(
                                                    reminder.reminderMessage!
                                                        .options!.length,
                                                    (index1) => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 5,
                                                                bottom: 5),
                                                        child: CustomContainer(
                                                            backColor: AppColors
                                                                .whiteColor,
                                                            borderColor:
                                                                AppColors
                                                                    .backColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          10,
                                                                      vertical:
                                                                          7),
                                                              child: Text(
                                                                reminder
                                                                    .reminderMessage!
                                                                    .options![
                                                                        index1]
                                                                    .option!,
                                                                style:
                                                                    AppTextstyle
                                                                        .text10
                                                                        .copyWith(
                                                                  fontSize: FontSizeManager
                                                                      .getFontSize(
                                                                          context,
                                                                          12),
                                                                  color: AppColors
                                                                      .textColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                              ),
                                                            ))),
                                                  ),
                                                ),
                                      height10,
                                      Text(
                                        "Replies",
                                        style: AppTextstyle.text10.copyWith(
                                          fontSize: FontSizeManager.getFontSize(
                                              context, 13),
                                          color: AppColors.secondaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      height6,
                                      reminder.replies == null ||
                                              reminder.replies!.isEmpty
                                          ? Center(
                                              child: Text(
                                                "No Replies Found!",
                                                style: AppTextstyle.text10
                                                    .copyWith(
                                                  fontSize: FontSizeManager
                                                      .getFontSize(context, 12),
                                                  color: AppColors.greyColor,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            )
                                          : Wrap(
                                              children: List.generate(
                                                reminder.replies!.length,
                                                (index2) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5, bottom: 5),
                                                  child: CustomContainer(
                                                    backColor:
                                                        AppColors.whiteColor,
                                                    borderColor:
                                                        AppColors.backColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10,
                                                          vertical: 7),
                                                      child: Text(
                                                        reminder
                                                                .replies![
                                                                    index2]
                                                                .reply ??
                                                            "No Reply", // <-- Avoid null
                                                        style: AppTextstyle
                                                            .text10
                                                            .copyWith(
                                                          fontSize:
                                                              FontSizeManager
                                                                  .getFontSize(
                                                                      context,
                                                                      12),
                                                          color: AppColors
                                                              .textColor,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ],
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
