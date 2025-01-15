import 'package:admin/app/core/extention/extenton.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/custom_button.dart';
import 'package:admin/app/core/widgets/custom_text_field.dart';
import 'package:admin/app/core/widgets/two_text.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:admin/app/screens/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  final loginController = Get.put(LoginController());
  final TextEditingController? emailController, passwordController;
  final bool? checkBoxValue, obsuretext;
  final Function(bool?)? onCheckBoxValueChange;
  final VoidCallback? ontap, onForgetPassowrd, onPassword, onRegister, onVarify;

  LoginForm(
      {super.key,
      this.emailController,
      this.passwordController,
      this.checkBoxValue = false,
      this.obsuretext = true,
      this.onCheckBoxValueChange,
      this.ontap,
      this.onForgetPassowrd,
      this.onPassword,
      this.onRegister,
      this.onVarify});

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
          if (Responsive.isDesktop(context)) ...[
            Text(
              "Sign In",
              style: AppTextstyle.text22.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 20),
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600),
            ),
          ],
          if (!Responsive.isDesktop(context)) ...[
            Text(
              "Welcome Back",
              style: AppTextstyle.text30.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 28),
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "Sign in your account",
              style: AppTextstyle.text12.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 15),
                  color: AppColors.hintColor,
                  fontWeight: FontWeight.w400),
            )
          ],
          height26,
          CustomTextfeild(
            title: "Email",
            hinttext: "Enter Email",
            iconPath: Icons.email,
            controller: loginController.emailcontroller,
            validator: (v) => v?.validEmail(),
          ),
          height20,
          Obx(
            () => CustomTextfeild(
              obscureText: loginController.obscure.value,
              controller: loginController.passwordcontroller,
              title: "Password",
              hinttext: "Enter password",
              validator: (v) => v?.validPassword(),
              iconPath: Icons.lock,
              icon: IconButton(
                  onPressed: () {
                    loginController.setObsureText();
                  },
                  icon: Icon(
                    loginController.obscure.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.secondaryColor,
                  )),
            ),
          ),
          height10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      splashRadius: 0,
                      fillColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                        return checkBoxValue!
                            ? AppColors.secondaryColor
                            : AppColors.whiteColor;
                      }),
                      activeColor: AppColors.secondaryColor,
                      checkColor: AppColors.whiteColor,
                      value: loginController.ischeck.value,
                      focusColor: AppColors.secondaryColor,
                      onChanged: (value) {
                        loginController.ischeck.value = value!;
                      },
                      side: BorderSide(color: AppColors.secondaryColor),
                    ),
                  ),
                  Text(
                    "Remember me",
                    style: AppTextstyle.text13.copyWith(
                        fontSize: FontSizeManager.getFontSize(context, 12),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.resetPassword);
                },
                child: Text(
                  "Forget Password?",
                  style: AppTextstyle.text13.copyWith(
                      fontSize: FontSizeManager.getFontSize(context, 11),
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          height16,
          CustomButton(
            ontap: ontap!,
            text: "Login",
            backColor: AppColors.secondaryColor,
            textColor: AppColors.whiteColor,
          ),
          height16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.signUp);
                  },
                  child: CustomRichText(
                    overflow: TextOverflow.ellipsis,
                    text1: "Don't have an account? ",
                    text2: " Register ",
                    style1: AppTextstyle.text14.copyWith(
                        fontSize: FontSizeManager.getFontSize(context, 12),
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500),
                    style2: AppTextstyle.text14.copyWith(
                        fontSize: FontSizeManager.getFontSize(context, 12),
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
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
        ],
      ),
    );
  }
}
