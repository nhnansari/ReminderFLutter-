import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_spaces.dart';
import '../../../core/utils/app_textstyle.dart';
import '../../../core/widgets/InnerPadding.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/small_buttom.dart';
import '../controller/team_controller.dart';
import '../model/team_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddTeamDailog extends StatelessWidget {
  final controller = Get.put(TeamController());
  final TeamData? teamData;
  final formkey = GlobalKey<FormState>();
  AddTeamDailog({super.key, this.teamData});

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
              Text(teamData == null ? "Add New Team" : "Update Team",
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
                        name: teamData == null ? "Add" : "Update",
                        textColor: AppColors.whiteColor,
                        backcolor: AppColors.primaryColor,
                        onclick: () {
                          if (formkey.currentState!.validate()) {
                            teamData == null
                                ? controller.addTeam()
                                : controller.updateTeam(teamId: teamData!.id);
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
