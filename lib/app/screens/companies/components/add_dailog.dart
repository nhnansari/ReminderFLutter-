import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_spaces.dart';
import '../../../core/utils/app_textstyle.dart';
import '../../../core/widgets/InnerPadding.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/small_buttom.dart';
import '../controller/companies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddDailog extends StatelessWidget {
  final controller = Get.put(CompaniesController());
  final formkey = GlobalKey<FormState>();
  AddDailog({super.key});

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
                validator: (v) =>
                    v?.isEmpty ?? true ? "Name is required" : null,
              ),
              height12,
              InnerPadding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SmallButton(
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
