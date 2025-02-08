import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/custom_text_field.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/screens/project/controller/project_controller.dart';
import 'package:admin/app/screens/project/model/project_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddProjectDailog extends StatelessWidget {
  final controller = Get.put(ProjectController());
  final formkey = GlobalKey<FormState>();
  final ProjectListData? projectListData;
  AddProjectDailog({super.key, this.projectListData});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150.w,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        projectListData != null
                            ? "Update Project"
                            : "Add Project",
                        style: AppTextstyle.text10.copyWith(
                            fontSize: FontSizeManager.getFontSize(context, 14),
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold)),
                    projectListData != null
                        ? Text("Create a new project",
                            style: AppTextstyle.text10.copyWith(
                              fontSize:
                                  FontSizeManager.getFontSize(context, 12),
                              color: AppColors.greyColor,
                            ))
                        : SizedBox(),
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close,
                      color: AppColors.greyColor,
                    ))
              ],
            ),
            height14,
            CustomTextfeild(
              titleColor: AppColors.textColor,
              title: "Name",
              hinttext: "Enter Name",
              iconPath: Icons.person,
              controller: controller.nameController,
              validator: (v) => v?.isEmpty ?? true ? "Name is required" : null,
            ),
            height12,
            CustomTextfeild(
              titleColor: AppColors.textColor,
              title: "Discription",
              hinttext: "Enter discription",
              iconPath: Icons.person,
              controller: controller.descController,
              validator: (v) =>
                  v?.isEmpty ?? true ? "Discription is required" : null,
            ),
            height12,
            CustomTextfeild(
              titleColor: AppColors.textColor,
              ontap: () {
                controller.pickStartDate(context);
              },
              readonly: true,
              title: "Start Date",
              hinttext: "Enter start date",
              iconPath: Icons.person,
              controller: controller.startDateController,
              validator: (v) => v?.isEmpty ?? true ? "Date is required" : null,
            ),
            height12,
            CustomTextfeild(
              titleColor: AppColors.textColor,
              ontap: () {
                controller.pickEndDate(context);
              },
              title: "End Date",
              readonly: true,
              hinttext: "Enter end date",
              iconPath: Icons.person,
              controller: controller.endDateController,
              validator: (v) => v?.isEmpty ?? true ? "Date is required" : null,
            ),
            height10,
            InnerPadding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SmallButton(
                    name: projectListData != null ? "Update" : "Add",
                    width: 90,
                    textColor: AppColors.whiteColor,
                    backcolor: AppColors.backColor,
                    onclick: () {
                      if (formkey.currentState!.validate()) {
                        // Perform registration logic
                        projectListData != null
                            ? controller.editProject(projectListData!.id)
                            : controller.createProject();
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
            ),
          ],
        ),
      ),
    );
  }
}
