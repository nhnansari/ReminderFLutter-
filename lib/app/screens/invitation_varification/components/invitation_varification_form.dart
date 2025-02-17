import '../../../core/extention/extenton.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_spaces.dart';
import '../../../core/utils/app_textstyle.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controller/invitation_varification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvitationVarificationForm extends StatelessWidget {
  final controller = Get.put(InvitationVarificationController());
  final loginFormKey = GlobalKey<FormState>();

  InvitationVarificationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height20,
          Text(
            "Invitaion",
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
            controller: controller.emailcontroller,
            validator: (v) => v?.validEmail(),
          ),
          height10,
          CustomTextfeild(
            titleColor: AppColors.textColor,
            controller: controller.otpController,
            iconPath: Icons.numbers,
            title: "Code",
            hinttext: "Enter Otp Code",
            validator: (v) {
              if (v == null && v!.isEmpty) {
                return "Otp is required!";
              } else if (v.length < 6) {
                return "Length must be greater then 6";
              }
              return null;
            },
          ),

          height10,

          CustomButton(
            ontap: () {
              if (loginFormKey.currentState!.validate()) {
                controller.acceptInvitation();
              }
            },
            text: "Accept",
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
      ),
    );
  }
}
