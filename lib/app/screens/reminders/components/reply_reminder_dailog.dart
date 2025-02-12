import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/Custom_container.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
// import 'package:admin/app/core/widgets/custom_snackbar.dart';
import 'package:admin/app/core/widgets/custom_text_field.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/screens/reminders/controller/reminder_controller.dart';
import 'package:admin/app/screens/reminders/model/reminder_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReplyReminderDailog extends StatelessWidget {
  final controller = Get.put(ReminderController());
  // final formkey = GlobalKey<FormState>();
  final ReminderData reminderData;

  ReplyReminderDailog({Key? key, required this.reminderData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: InnerPadding(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 100.w),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reply Reminder",
                      style: AppTextstyle.text10.copyWith(
                        fontSize: FontSizeManager.getFontSize(context, 14),
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Reply a reminder to worker",
                      style: AppTextstyle.text10.copyWith(
                        fontSize: FontSizeManager.getFontSize(context, 12),
                        color: AppColors.greyColor,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.close,
                    color: AppColors.greyColor,
                  ),
                )
              ],
            ),
            height20,
            Text(
              "Reply to : ${reminderData.reminderMessage!.message}",
              style: AppTextstyle.text10.copyWith(
                fontSize: FontSizeManager.getFontSize(context, 14),
                color: AppColors.textColor,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
              ),
            ),
            height10,
            CustomTextfeild(
              hinttext: "Reply to reminder",
              controller: controller.replyController,
              iconPath: Icons.reply,
            ),
            height10,
            Obx(
              () => SizedBox(
                width: 150.w,
                child: Wrap(
                    children: List.generate(
                  reminderData.reminderMessage!.options!.length,
                  (index) => InkWell(
                    onTap: () {
                      controller.changeIndex(index);
                    },
                    child: CustomContainer(
                        margin: EdgeInsets.only(right: 5, bottom: 9),
                        backColor: controller.optionIndex.value == index
                            ? AppColors.primaryColor
                            : AppColors.whiteColor,
                        borderColor: controller.optionIndex.value == index
                            ? AppColors.primaryColor
                            : AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(100),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          child: Text(
                            reminderData.reminderMessage!.options![index].option
                                .toString(),
                            style: AppTextstyle.text10.copyWith(
                              fontSize:
                                  FontSizeManager.getFontSize(context, 12),
                              color: controller.optionIndex.value == index
                                  ? AppColors.whiteColor
                                  : AppColors.textColor,
                            ),
                          ),
                        )),
                  ),
                )),
              ),
            ),
            // First dropdown: Projects

            height10,

            InnerPadding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SmallButton(
                    name: "Send",
                    width: 90,
                    textColor: AppColors.whiteColor,
                    backcolor: AppColors.backColor,
                    onclick: () {
                      // if (reminderData.reminderMessage!.options != null) {
                      controller.replyReminder(
                          reminderId: reminderData.id,
                          optionId: controller.optionIndex.value != -1
                              ? reminderData.reminderMessage!
                                  .options![controller.optionIndex.value].id
                              : null);
                      // } else {
                      //   CustomSnackBar.show(message: "No Options Found");
                      // }
                      // Perform the reminder submission logic here
                    },
                  ),
                  const VerticalDivider(),
                  SmallButton(
                    name: "Cancel",
                    width: 90,
                    textColor: AppColors.whiteColor,
                    backcolor: AppColors.greyColor,
                    onclick: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// A dynamic dropdown field that can be used with different lists and selected values.
}
