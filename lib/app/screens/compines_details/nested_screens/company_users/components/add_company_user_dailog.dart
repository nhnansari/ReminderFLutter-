import 'package:admin/app/core/extention/extenton.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/custom_text_field.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/screens/compines_details/nested_screens/company_users/controller/company_user_controller.dart';
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
        child: InnerPadding(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 200.w,
              ),
              Text("Add New User",
                  style: AppTextstyle.text10.copyWith(
                      fontSize: FontSizeManager.getFontSize(context, 14),
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold)),
              height14,
              CustomTextfeild(
                  title: "Email",
                  hinttext: "Enter Email",
                  iconPath: Icons.person,
                  controller: controller.emailController,
                  validator: (v) => v?.validEmail()),
              height12,
              Obx(
                () => CustomTextfeild(
                  // title: "Role",
                  hinttext: "Choose role",
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SmallButton(
                        name: "Add",
                        textColor: AppColors.whiteColor,
                        backcolor: AppColors.primaryColor,
                        onclick: () {
                          if (formkey.currentState!.validate()) {
                            controller.addCompanyUser();
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
