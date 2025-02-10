import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/custom_snackbar.dart';
import 'package:admin/app/core/widgets/custom_text_field.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/screens/custom_messages/controller/custom_messages_controller.dart';
import 'package:admin/app/screens/custom_messages/model/custom_mesg_model.dart';
import 'package:admin/app/screens/custom_messages/model/option_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddCustomMessageDialog extends StatelessWidget {
  final controller = Get.put(CustomMessagesController());
  final formKey = GlobalKey<FormState>();
  final ReminderMessages? options; // Optional parameter for edit mode

  AddCustomMessageDialog({super.key, this.options}) {
    if (options != null) {
      // Pre-fill data for edit mode
      controller.msgController.text = options!.message ?? '';
      controller.isAddOptions.value = true;

      // Map Options to OptionModel
      controller.options.value = (options!.options ?? []).map((option) {
        // Convert Options to OptionModel
        return OptionModel(
          option: TextEditingController(
              text: option.option), // Replace with correct field mapping
          nature: option.nature!,
          movesTask: option.movesTask!, // Replace with correct field mapping
        );
      }).toList();
    } else {
      // Clear data for add mode
      controller.msgController.clear();
      controller.isAddOptions.value = false;
      controller.options.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Form(
        key: formKey,
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200.w,
                ),
                // Dialog Header
                Row(
                  children: [
                    Text(
                      options == null ? "Add New Message" : "Edit Message",
                      style: AppTextstyle.text10.copyWith(
                        fontSize: FontSizeManager.getFontSize(context, 14),
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
                height14,

                // Message Input
                CustomTextfeild(
                  titleColor: AppColors.textColor,
                  title: "Message",
                  hinttext: "Enter Message",
                  controller: controller.msgController,
                  iconPath: Icons.message,
                  validator: (value) =>
                      value?.isEmpty ?? true ? "Message is required" : null,
                ),
                height10,

                // Add Options Button
                if (!controller.isAddOptions.value)
                  Row(
                    children: [
                      SmallButton(
                        name: "Add Options",
                        textColor: AppColors.whiteColor,
                        backcolor: AppColors.backColor,
                        onclick: () {
                          controller.isAddOptions.value = true;
                          controller.addOption();
                        },
                      ),
                    ],
                  ),

                // Options List
                if (controller.isAddOptions.value)
                  ...controller.options.asMap().entries.map((entry) {
                    int index = entry.key;
                    OptionModel option = entry.value;
                    final key = GlobalKey();

                    return Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: AppColors.primaryColor),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Row(
                                  children: [
                                    Text(
                                      "Option ${index + 1}",
                                      style: AppTextstyle.text10.copyWith(
                                        fontSize: FontSizeManager.getFontSize(
                                            context, 14),
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        controller.removeOption(index);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: AppColors.errorColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 0,
                                color: AppColors.greyColor,
                              ),
                              InnerPadding(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextfeild(
                                      titleColor: AppColors.textColor,
                                      title: "Option",
                                      iconPath: Icons.subtitles,
                                      hinttext: "Enter Option",
                                      controller: option.option,
                                      validator: (value) =>
                                          value?.isEmpty ?? true
                                              ? "Option is required"
                                              : null,
                                    ),
                                    height10,
                                    Text(
                                      "Points to Status:",
                                      style: AppTextstyle.text10.copyWith(
                                        fontSize: FontSizeManager.getFontSize(
                                            context, 13),
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    height10,

                                    // Dropdown for Status
                                    GestureDetector(
                                      key: key,
                                      onTap: () async {
                                        final RenderBox box = key
                                            .currentContext!
                                            .findRenderObject() as RenderBox;
                                        final Offset position =
                                            box.localToGlobal(Offset.zero);
                                        final double buttonHeight =
                                            box.size.height;

                                        var status = await showMenu(
                                          context: context,
                                          position: RelativeRect.fromLTRB(
                                            position.dx,
                                            position.dy +
                                                buttonHeight +
                                                5, // Dropdown below button
                                            position.dx + box.size.width,
                                            position.dy + buttonHeight + 50,
                                          ),
                                          items: [
                                            PopupMenuItem(
                                              value: 'Pending',
                                              child: Text(
                                                'Pending',
                                                style: AppTextstyle.text10
                                                    .copyWith(
                                                  fontSize: FontSizeManager
                                                      .getFontSize(context, 12),
                                                  color: AppColors.textColor,
                                                ),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: 'In_Progress',
                                              child: Text(
                                                'In_Progress',
                                                style: AppTextstyle.text10
                                                    .copyWith(
                                                  fontSize: FontSizeManager
                                                      .getFontSize(context, 12),
                                                  color: AppColors.textColor,
                                                ),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: 'Completed',
                                              child: Text(
                                                'Completed',
                                                style: AppTextstyle.text10
                                                    .copyWith(
                                                  fontSize: FontSizeManager
                                                      .getFontSize(context, 12),
                                                  color: AppColors.textColor,
                                                ),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: 'Cancelled',
                                              child: Text(
                                                'Cancelled',
                                                style: AppTextstyle.text10
                                                    .copyWith(
                                                  fontSize: FontSizeManager
                                                      .getFontSize(context, 12),
                                                  color: AppColors.textColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );

                                        if (status != null) {
                                          option.nature = status;
                                          controller.options.refresh();
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          border: Border.all(
                                              color: AppColors.backColor),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          option.nature.isEmpty
                                              ? "Select a Status"
                                              : controller.options
                                                      .map((option) =>
                                                          option.nature)
                                                      .contains(option.nature)
                                                  ? option.nature
                                                  : "Select a Status",
                                          style: AppTextstyle.text10.copyWith(
                                            fontSize:
                                                FontSizeManager.getFontSize(
                                                    context, 12),
                                            color: AppColors.textColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        height10,
                      ],
                    );
                  }).toList(),

                // Add More Button
                if (controller.isAddOptions.value)
                  Row(
                    children: [
                      SmallButton(
                        name: "Add More",
                        textColor: AppColors.whiteColor,
                        backcolor: AppColors.backColor,
                        onclick: controller.addOption,
                      ),
                    ],
                  ),
                height10,

                // Save and Cancel Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SmallButton(
                      name: "Save",
                      width: 90,
                      textColor: AppColors.whiteColor,
                      backcolor: AppColors.backColor,
                      onclick: () {
                        if (formKey.currentState!.validate() &&
                            controller.validateOptions()) {
                          if (options == null) {
                            // Add new message
                            controller.createMsg();
                          } else {
                            // Update existing message
                            controller.updateMsg(options!.id);
                          }
                        } else {
                          CustomSnackBar.show(
                            message: "All fields are required!",
                            backColor: AppColors.errorColor,
                          );
                        }
                      },
                    ),
                    VerticalDivider(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
