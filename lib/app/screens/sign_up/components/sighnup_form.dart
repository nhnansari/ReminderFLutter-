import 'package:admin/app/core/extention/extenton.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/custom_button.dart';
import 'package:admin/app/core/widgets/custom_text_field.dart';
import 'package:admin/app/screens/sign_up/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_spaces.dart';

class SignUpForm extends StatelessWidget {
  final controller = Get.put(SignUpController());
  final VoidCallback? ontap;

  SignUpForm({
    super.key,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height20,
        Text(
          "Sign Up",
          style: AppTextstyle.text24.copyWith(
              fontSize: FontSizeManager.getFontSize(context, 20),
              color: AppColors.textColor,
              fontWeight: FontWeight.w600),
        ),
        height20,
        CustomTextfeild(
          title: "Name",
          titleColor: AppColors.textColor,
          hinttext: "Enter Name",
          iconPath: Icons.person,
          controller: controller.nameController,
          validator: (v) => v?.isEmpty ?? true ? "Name is required" : null,
        ),
        height10,
        CustomTextfeild(
          titleColor: AppColors.textColor,
          title: "Email",
          hinttext: "Enter Email",
          iconPath: Icons.email,
          controller: controller.emailController,
          validator: (v) => v?.validEmail(),
        ),
        height10,
        Obx(
          () => CustomTextfeild(
            titleColor: AppColors.textColor,
            obscureText: controller.obscure.value,
            controller: controller.passwordController,
            title: "Password",
            hinttext: "Enter password",
            validator: (v) => v?.validPassword(),
            iconPath: Icons.lock,
            icon: IconButton(
                onPressed: () {
                  controller.setObsureText();
                },
                icon: Icon(
                  controller.obscure.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppColors.secondaryColor,
                )),
          ),
        ),
        height16,
        Obx(
          () => CustomButton(
            loading: controller.isloading.value,
            ontap: () {
              ontap!();
            },
            text: "Register",
            backColor: AppColors.secondaryColor,
            textColor: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
