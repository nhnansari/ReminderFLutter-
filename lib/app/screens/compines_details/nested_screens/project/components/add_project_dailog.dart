import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/custom_text_field.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/screens/compines_details/nested_screens/project/controller/project_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddProjectDailog extends StatelessWidget {
  final controller = Get.put(ProjectController());
  final formkey = GlobalKey<FormState>();
  AddProjectDailog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: formkey,
        child: InnerPadding(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 200.w,
              ),
              Text("Add Project",
                  style: AppTextstyle.text10.copyWith(
                      fontSize: FontSizeManager.getFontSize(context, 14),
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold)),
              height14,
              CustomTextfeild(
                title: "Name",
                hinttext: "Enter Name",
                iconPath: Icons.person,
                controller: controller.nameController,
                validator: (v) =>
                    v?.isEmpty ?? true ? "Name is required" : null,
              ),
              height12,
              CustomTextfeild(
                title: "Discription",
                hinttext: "Enter discription",
                iconPath: Icons.person,
                controller: controller.descController,
                validator: (v) =>
                    v?.isEmpty ?? true ? "Discription is required" : null,
              ),
              height12,
              CustomTextfeild(
                ontap: () {
                  controller.pickStartDate(context);
                },
                readonly: true,
                title: "Start Date",
                hinttext: "Enter start date",
                iconPath: Icons.person,
                controller: controller.startDateController,
                validator: (v) =>
                    v?.isEmpty ?? true ? "Date is required" : null,
              ),
              height12,
              CustomTextfeild(
                ontap: () {
                  controller.pickEndDate(context);
                },
                title: "End Date",
                readonly: true,
                hinttext: "Enter end date",
                iconPath: Icons.person,
                controller: controller.endDateController,
                validator: (v) =>
                    v?.isEmpty ?? true ? "Date is required" : null,
              ),
              InnerPadding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SmallButton(
                        name: "Add",
                        textColor: AppColors.whiteColor,
                        backcolor: AppColors.primaryColor,
                        onclick: () {
                          if (formkey.currentState!.validate()) {
                            // Perform registration logic
                            controller.createProject();
                          }
                        },
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: SmallButton(
                        name: "Cancel",
                        textColor: AppColors.whiteColor,
                        backcolor: AppColors.greyColor,
                        onclick: () {
                          Get.back();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
