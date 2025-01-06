import 'package:admin/app/core/extention/extenton.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/custom_button.dart';
import 'package:admin/app/core/widgets/custom_otp_field.dart';
import 'package:admin/app/core/widgets/custom_text_field.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:admin/app/screens/reset_password/components/step.dart';
import 'package:admin/app/screens/reset_password/controller/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPasswordForm extends StatelessWidget {
  final controller = Get.put(ResetPasswordController());
  final restRequest = GlobalKey<FormState>();

  ResetPasswordForm({
    super.key,
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
      child: Obx(
        () => Form(
          key: restRequest,
          child: Column(
            children: [
              Text(
                "Forget Password",
                style: AppTextstyle.text22.copyWith(
                    fontSize: FontSizeManager.getFontSize(context, 20),
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600),
              ),
              height26,
              FormStepper(
                currentIndex: controller.currentIndex.value,
              ),
              height20,
              if (controller.currentIndex.value == 0) ...[
                CustomTextfeild(
                  controller: controller.emailController,
                  title: "Email",
                  hinttext: "Enter Email",
                  iconPath: Icons.email,
                ),
                height20,
                CustomButton(
                  ontap: () {
                    if (restRequest.currentState!.validate()) {
                      controller.verifyPassRequest();
                    }
                  },
                  text: "Submit",
                  backColor: AppColors.secondaryColor,
                  textColor: AppColors.whiteColor,
                ),
                height18,
                footerRow(
                  context: context,
                  text1: "Login",
                  text2: "Create an account",
                  onText1: () {
                    Get.offAllNamed(AppRoutes.login);
                  },
                  onText2: () {
                    Get.offAllNamed(AppRoutes.signUp);
                  },
                )
              ],
              if (controller.currentIndex.value == 1) ...[
                Text("Enter code sent",
                    style: AppTextstyle.text14.copyWith(
                      fontSize: FontSizeManager.getFontSize(context, 12),
                    )),
                height18,
                CustomPinCodeField(
                  controller: controller.otpController,
                ),
                height20,
                CustomButton(
                  ontap: () { if (restRequest.currentState!.validate()) {
                      controller.VarifyOtp();
                    }},
                  text: "Varify",
                  backColor: AppColors.secondaryColor,
                  textColor: AppColors.whiteColor,
                ),
                height18,
                footerRow(
                    context: context,
                    text1: "Resend code",
                    text2: "Didn't receive code?",
                    onText1: () {},
                    onText2: () {})
              ],
              if (controller.currentIndex.value == 2) ...[
                CustomTextfeild(
                  controller: controller.newPasswordController,
                  obscureText: controller.newPasswordObscure.value,
                  validator: (v) => v?.validPassword(),
                  title: "New Password",
                  icon: IconButton(
                      onPressed: () {
                        controller.setObsureText(controller.newPasswordObscure);
                      },
                      icon: Icon(
                        controller.newPasswordObscure.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.secondaryColor,
                      )),
                  hinttext: "Enter New Password",
                  iconPath: Icons.lock,
                ),
                height18,
                CustomTextfeild(
                  validator: (v) {
                    if (v!.isEmpty &&
                        v != controller.confirmPasswordController.text) {
                      return "Password Does'nt Match";
                    }
                    return null;
                  },
                  obscureText: controller.confirmPasowordObscure.value,
                  controller: controller.confirmPasswordController,
                  title: "Confirm Password",
                  icon: IconButton(
                      onPressed: () {
                        controller
                            .setObsureText(controller.confirmPasowordObscure);
                      },
                      icon: Icon(
                        controller.confirmPasowordObscure.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.secondaryColor,
                      )),
                  hinttext: "Enter Confirm Password",
                  iconPath: Icons.lock,
                ),
                height20,
                CustomButton(
                  ontap: () { if (restRequest.currentState!.validate()) {
                      controller.setResetPassword();
                    }},
                  text: "Submit",
                  backColor: AppColors.secondaryColor,
                  textColor: AppColors.whiteColor,
                ),
                height18,
                footerRow(
                  context: context,
                  text1: "Login",
                  text2: "Create an account",
                  onText1: () {
                    Get.offAllNamed(AppRoutes.login);
                  },
                  onText2: () {
                    Get.offAllNamed(AppRoutes.signUp);
                  },
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}

Widget footerRow(
    {required String text1,
    required String text2,
    required BuildContext context,
    required VoidCallback onText1,
    required VoidCallback onText2}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: onText1,
        child: Text(
          text1,
          style: AppTextstyle.text14.copyWith(
            color: AppColors.secondaryColor,
            fontSize: FontSizeManager.getFontSize(context, 12),
          ),
        ),
      ),
      InkWell(
        onTap: onText2,
        child: Text(
          text2,
          style: AppTextstyle.text14.copyWith(
              fontSize: FontSizeManager.getFontSize(context, 12),
              color: AppColors.primaryColor),
        ),
      )
    ],
  );
}
