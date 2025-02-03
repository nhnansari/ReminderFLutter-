import 'package:admin/app/core/extention/extenton.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/custom_text_field.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/screens/company_users/controller/company_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddCompanyUserDailog extends StatelessWidget {
  final controller = Get.put(CompanyUserController());
  final formkey = GlobalKey<FormState>();
  AddCompanyUserDailog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 150.w,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Add New Employee",
                          style: AppTextstyle.text10.copyWith(
                              fontSize:
                                  FontSizeManager.getFontSize(context, 14),
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold)),
                      Text("Create a new employee profile",
                          style: AppTextstyle.text10.copyWith(
                            fontSize: FontSizeManager.getFontSize(context, 12),
                            color: AppColors.greyColor,
                          )),
                    ],
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
                    ))
              ],
            ),
            height14,
            CustomTextfeild(
                titleColor: AppColors.textColor,
                title: "Email",
                hinttext: "Enter Email",
                iconPath: Icons.person,
                controller: controller.emailController,
                validator: (v) => v?.validEmail()),
            height12,
            Obx(
              () => CustomTextfeild(
                titleColor: AppColors.textColor,
                title: "Position",
                // title: "Role",
                hinttext: "Choose Position",
                dropdownItems: ["Admin", "Worker", "Manager"],
                onDropdownChanged: (v) {
                  controller.selectedItem.value = v!;
                },
                selectedItem: controller.selectedItem.value,
                validator: (v) =>
                    v?.isEmpty ?? true ? "Role is required" : null,
              ),
            ),
            InnerPadding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SmallButton(
                    name: "Add",
                    width: 90,
                    textColor: AppColors.whiteColor,
                    backcolor: AppColors.backColor,
                    onclick: () {
                      if (formkey.currentState!.validate()) {
                        controller.addCompanyUser();
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
