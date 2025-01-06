import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/custom_text_field.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/screens/companies/controller/companies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddDailog extends StatelessWidget {
  final controller = Get.put(CompaniesController());
  final formkey = GlobalKey<FormState>();
  AddDailog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      content: Form(
        key: formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Register New Company",
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
              validator: (v) => v?.isEmpty ?? true ? "Name is required" : null,
            ),
            height12,
            CustomTextfeild(
              title: "Sub Domain",
              hinttext: "Enter sub domain",
              iconPath: Icons.person,
              inputFormatter: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')) // Deny spaces
              ],
              controller: controller.subDomainController,
              validator: (v) =>
                  v?.isEmpty ?? true ? "Domain is required" : null,
            ),
            height12,
            CustomTextfeild(
              title: "Company url",
              hinttext: "Enter Company logo url",
              iconPath: Icons.person,
              controller: controller.urlController,
              validator: (v) => v?.isEmpty ?? true ? "url is required" : null,
            ),
            height12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SmallButton(
                  name: "Register",
                  textColor: AppColors.whiteColor,
                  backcolor: AppColors.primaryColor,
                  onclick: () {
                    if (formkey.currentState!.validate()) {
                      // Perform registration logic
                      controller.registerCompany();
                    }
                  },
                ),
                SmallButton(
                  name: "Cancel",
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
    );
  }
}
