import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/custom_text_field.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/screens/team/controller/team_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddTeamDailog extends StatelessWidget {
  final controller = Get.put(TeamController());
  final formkey = GlobalKey<FormState>();
  AddTeamDailog({super.key});

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
              Text("Add New Team",
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
                  validator: (v) {
                    if (v == null && v!.isEmpty) {
                      return "Team Required";
                    }
                    return null;
                  }),
              height12,
              CustomTextfeild(
                  title: "Description",
                  hinttext: "Enter description",
                  iconPath: Icons.description,
                  controller: controller.descController,
                  validator: (v) {
                    if (v == null && v!.isEmpty) {
                      return "Description Required";
                    }
                    return null;
                  }),
              height12,
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
                            controller.addTeam();
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
