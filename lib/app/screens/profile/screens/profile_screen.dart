import 'package:admin/app/core/extention/extenton.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/custom_button.dart';
import 'package:admin/app/core/widgets/custom_snackbar.dart';
import 'package:admin/app/core/widgets/custom_text_field.dart';
import 'package:admin/app/screens/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  final formKey = GlobalKey<FormState>();
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) => SafeArea(
              child: InnerPadding(
                  child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    height20,
                    Text(
                      "Profile",
                      style: AppTextstyle.text22.copyWith(
                          fontSize: FontSizeManager.getFontSize(context, 20),
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w600),
                    ),
                    height20,
                    LayoutBuilder(
                      builder: (context, constraints) {
                        double formWidth = constraints.maxWidth < 400
                            ? constraints.maxWidth * 0.9
                            : 600; // Adjusts width dynamically but caps at 400
                        return Center(
                          child: SizedBox(
                            width: formWidth,
                            child: Obx(
                              () => Column(
                                children: [
                                  CustomTextfeild(
                                    titleColor: AppColors.textColor,
                                    controller: controller.nameController,
                                    title: "Name",
                                    hinttext: "Enter Your Name",
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return "Name is required!";
                                      } else {
                                        return null;
                                      }
                                    },
                                    iconPath: Icons.person,
                                  ),
                                  height14,
                                  CustomTextfeild(
                                    titleColor: AppColors.textColor,
                                    obscureText:
                                        controller.oldPasswordObscure.value,
                                    controller:
                                        controller.oldPasswordController,
                                    title: "Old Password",
                                    hinttext: "Enter old password",
                                    validator: (v) => v?.validPassword(),
                                    iconPath: Icons.lock,
                                    icon: IconButton(
                                      onPressed: () => controller.setObscure(
                                          controller.oldPasswordObscure),
                                      icon: Icon(
                                        controller.oldPasswordObscure.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                  ),
                                  height14,
                                  CustomTextfeild(
                                    titleColor: AppColors.textColor,
                                    obscureText:
                                        controller.newPasswordObscure.value,
                                    controller: controller.passwordController,
                                    title: "New Password",
                                    hinttext: "Enter new password",
                                    validator: (v) => v?.validPassword(),
                                    iconPath: Icons.lock,
                                    icon: IconButton(
                                      onPressed: () => controller.setObscure(
                                          controller.newPasswordObscure),
                                      icon: Icon(
                                        controller.newPasswordObscure.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                  ),
                                  height14,
                                  CustomTextfeild(
                                    titleColor: AppColors.textColor,
                                    obscureText:
                                        controller.confirmPasswordObscure.value,
                                    controller:
                                        controller.confirmPasswordController,
                                    title: "Confirm Password",
                                    hinttext: "Enter confirm password",
                                    validator: (v) => v?.validPassword(),
                                    iconPath: Icons.lock,
                                    icon: IconButton(
                                      onPressed: () => controller.setObscure(
                                          controller.confirmPasswordObscure),
                                      icon: Icon(
                                        controller.confirmPasswordObscure.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                  ),
                                  height16,
                                  CustomButton(
                                    ontap: () {
                                      if (formKey.currentState!.validate()) {
                                        if (controller
                                                .passwordController.text !=
                                            controller.confirmPasswordController
                                                .text) {
                                          CustomSnackBar.show(
                                              message:
                                                  "Password does'nt matched");
                                        } else {
                                          controller.updateProfile();
                                        }
                                      }
                                    },
                                    text: "Update",
                                    backColor: AppColors.secondaryColor,
                                    textColor: AppColors.whiteColor,
                                  ),
                                  height16,
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    // height16,
                    // if (!Responsive.issmallscreen(context)) ...[
                    //   InkWell(
                    //     onTap: onForgetPassowrd,
                    //     child: CustomRichText(
                    //       text1: "Forgot Password? ",
                    //       text2: " Password",
                    //       style1: AppTextstyle.text14.copyWith(
                    //           color: AppColors.primaryColor,
                    //           fontWeight: FontWeight.w500),
                    //       style2: AppTextstyle.text14.copyWith(
                    //           color: AppColors.secondaryColor,
                    //           fontWeight: FontWeight.w600),
                    //     ),
                    //   ),
                    //   height16,
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
              )),
            ));
  }
}
