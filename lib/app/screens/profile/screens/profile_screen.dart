import 'package:admin/app/core/assets/app_images.dart';
import 'package:admin/app/core/extention/extenton.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/custom_button.dart';
import 'package:admin/app/core/widgets/custom_text_field.dart';
import 'package:admin/app/screens/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  final loginFormKey = GlobalKey<FormState>();
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) => SafeArea(
              child: InnerPadding(
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
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColors.transparentColor,
                                    maxRadius: 80,
                                    child: CircleAvatar(
                                      maxRadius: 60,
                                      backgroundImage:
                                          AssetImage(AppImages.profile),
                                    ),
                                  ),
                                  Positioned(
                                    top: 100,
                                    left: 115,
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: AppColors.secondaryColor,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.edit,
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              height14,
                              CustomTextfeild(
                                titleColor: AppColors.textColor,
                                controller: controller.nameController,
                                title: "Name",
                                hinttext: "Enter Your Name",
                                validator: (v) => v?.validPassword(),
                                iconPath: Icons.person,
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
                              height16,
                              CustomButton(
                                ontap: () {},
                                text: "Update",
                                backColor: AppColors.secondaryColor,
                                textColor: AppColors.whiteColor,
                              ),
                              height16,
                            ],
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
              )),
            ));
  }
}
