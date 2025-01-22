import 'package:admin/app/core/extention/extenton.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/custom_button.dart';
import 'package:admin/app/core/widgets/custom_text_field.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:admin/app/screens/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height20,
        Text(
          "Login",
          style: AppTextstyle.text22.copyWith(
              fontSize: FontSizeManager.getFontSize(context, 20),
              color: AppColors.textColor,
              fontWeight: FontWeight.w600),
        ),
        height20,
        CustomTextfeild(
          title: "Email",
          titleColor: AppColors.textColor,
          hinttext: "Enter Email",
          iconPath: Icons.email,
          controller: loginController.emailcontroller,
          validator: (v) => v?.validEmail(),
        ),
        height20,
        Obx(
          () => CustomTextfeild(
            titleColor: AppColors.textColor,
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
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.resetPassword);
            },
            child: Text(
              "Forget Password?",
              style: AppTextstyle.text13.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 11),
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),

        height16,
        CustomButton(
          ontap: ontap!,
          text: "Login",
          backColor: AppColors.secondaryColor,
          textColor: AppColors.whiteColor,
        ),
        height16,

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
    );
  }
}
