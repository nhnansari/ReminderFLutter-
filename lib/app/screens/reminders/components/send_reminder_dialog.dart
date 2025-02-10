import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/screens/reminders/controller/reminder_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SendReminderDialog extends StatelessWidget {
  final controller = Get.put(ReminderController());
  final formkey = GlobalKey<FormState>();

  SendReminderDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // For demonstration, assume you have three lists in your controller.
    // You might need to adjust these according to your actual data.
    List<Map<String, dynamic>> uniqueProjects = controller.teamController.teams
        .map((e) => {"id": e.id.toString(), "name": e.name.toString()})
        .toSet()
        .toList();

    List<Map<String, dynamic>> uniqueTeams = controller
        .companyWorkerController.companyUsers
        .map((e) =>
            {"id": e.user!.id.toString(), "name": e.user!.fullName.toString()})
        .toSet()
        .toList();

    List<Map<String, dynamic>> uniqueCategories = controller
        .msgController.customsMsgs
        .map((e) => {"id": e.id.toString(), "name": e.message.toString()})
        .toSet()
        .toList();

    return AlertDialog(
      content: Form(
        key: formkey,
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
                      "Send Reminder",
                      style: AppTextstyle.text10.copyWith(
                        fontSize: FontSizeManager.getFontSize(context, 14),
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Send a reminder to worker",
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
            // First dropdown: Projects
            dynamicDropdownField(
              context: context,
              itemList: uniqueProjects,
              selectedValue: controller.selectedTeamId,
              hintText: "Choose Team",
            ),
            height10,
            // Second dropdown: Teams
            dynamicDropdownField(
              context: context,
              itemList: uniqueTeams,
              selectedValue: controller.selectedUserId,
              hintText: "Choose Worker",
            ),
            height10,
            // Third dropdown: Categories
            dynamicDropdownField(
              context: context,
              itemList: uniqueCategories,
              selectedValue: controller.selectedMsgId,
              hintText: "Choose Message",
            ),
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
                      if (formkey.currentState!.validate()) {
                        controller.sendReminder();
                        // Perform the reminder submission logic here
                      }
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
  Widget dynamicDropdownField({
    required BuildContext context,
    required List<Map<String, dynamic>> itemList,
    required RxString selectedValue,
    required String hintText,
  }) {
    bool isListEmpty = itemList.isEmpty;

    return DropdownButtonFormField<String>(
      hint: Text(
        isListEmpty ? "No Option Found" : hintText,
        textAlign: TextAlign.start,
        style: AppTextstyle.text14.copyWith(
          overflow: TextOverflow.ellipsis,
          fontSize: FontSizeManager.getFontSize(context, 13),
          color: AppColors.whiteColor,
        ),
      ),
      style: AppTextstyle.text10.copyWith(
        color: AppColors.whiteColor,
        fontSize: FontSizeManager.getFontSize(context, 13),
      ),
      value: isListEmpty || selectedValue.value.isEmpty
          ? null
          : selectedValue.value,
      isExpanded: true,
      items: isListEmpty
          ? []
          : itemList.map<DropdownMenuItem<String>>((item) {
              return DropdownMenuItem<String>(
                value: item["id"],
                child: Text(
                  item["name"],
                  style: AppTextstyle.text10.copyWith(
                    color: AppColors.whiteColor,
                    fontSize: FontSizeManager.getFontSize(context, 13),
                  ),
                ),
              );
            }).toList(),
      onChanged: isListEmpty
          ? null
          : (String? selectedId) {
              if (selectedId != null) {
                selectedValue.value = selectedId;
                print("Selected ID: ${selectedValue.value}");
              }
            },
      dropdownColor: AppColors.primaryColor,
      decoration: InputDecoration(
        fillColor: AppColors.secondaryColor,
        filled: true,
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.secondaryColor,
          ),
        ),
        errorStyle: AppTextstyle.text12.copyWith(color: Colors.red),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.errorColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.secondaryColor,
          ),
        ),
        isCollapsed: Responsive.isMobile(context) ? true : null,
        hintText: isListEmpty ? "No Option Found" : hintText,
        hintStyle: AppTextstyle.text14.copyWith(
          color: AppColors.hintColor,
          fontSize: FontSizeManager.getFontSize(context, 12),
        ),
      ),
    );
  }
}
