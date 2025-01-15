
import 'package:admin/app/core/extention/extenton.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/custom_button.dart';
import 'package:admin/app/core/widgets/custom_text_field.dart';
import 'package:admin/app/core/widgets/two_text.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:admin/app/screens/sign_up/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
              color: Responsive.isDesktop(context)
                  ? AppColors.primaryColor
                  : AppColors.transparentColor,
              width: 1.h)),
      child: Column(
        children: [
          Text(
            "Register",
            style: AppTextstyle.text24.copyWith(
                fontSize: FontSizeManager.getFontSize(context, 24),
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600),
          ),
          if (!Responsive.isDesktop(context)) ...[
            height8,
            Text(
              "Sign up your account",
              style: AppTextstyle.text12.copyWith(
                fontSize: FontSizeManager.getFontSize(context, 14),
                color: AppColors.blackColor,
              ),
            ),
          ],
          height26,
         
          height10,
          CustomTextfeild(
            title: "Name",
            hinttext: "Enter Name",
            iconPath: Icons.person,
            controller: controller.nameController,
            validator: (v) => v?.isEmpty ?? true ? "Name is required" : null,
          ),
          height10,
          CustomTextfeild(
            title: "Email",
            hinttext: "Enter Email",
            iconPath: Icons.email,
            controller: controller.emailController,
            validator: (v) => v?.validEmail(),
          ),
          height10,
          Obx(
            () => CustomTextfeild(
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
          height16,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.login);
                },
                child: CustomRichText(
                  text1: " Already Have An Account?",
                  text2: " Login ",
                  style1: AppTextstyle.text14.copyWith(
                      fontSize: FontSizeManager.getFontSize(context, 13),
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                  style2: AppTextstyle.text14.copyWith(
                      color: AppColors.secondaryColor,
                      fontSize: FontSizeManager.getFontSize(context, 13),
                      fontWeight: FontWeight.w600),
                ),
              ),
              // height16,
              // if (!Responsive.issmallscreen(context)) ...[
              //   InkWell(
              //     onTap: onVarify,
              //     child: CustomRichText(
              //       text1: "Did not Verify? ",
              //       text2: " Resend Email OTP",
              //       style1: AppTextstyle.text14.copyWith(
              //           color: AppColors.primaryColor,
              //           fontWeight: FontWeight.w500),
              //       style2: AppTextstyle.text14.copyWith(
              //           color: AppColors.secondaryColor,
              //           fontWeight: FontWeight.w600),
              //     ),
              //   ),
              // ]
            ],
          ),
        ],
      ),
    );
  }
}
