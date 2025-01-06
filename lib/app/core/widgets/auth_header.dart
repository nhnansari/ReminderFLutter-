import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backColor,
      padding: EdgeInsets.symmetric(
        horizontal: 7.w,
      ),
      height: 60.h,
      child: Row(
        children: [
          if (!Responsive.isMobile(context))
            Text(
              "Reminder App",
              style: AppTextstyle.text10.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 16),
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold),
            ),
          if (!Responsive.isMobile(context))
            Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
          SmallButton(
            name: "Login",
            textColor: AppColors.whiteColor,
            backcolor: AppColors.primaryColor,
            fontSize: 13,
            onclick: () {
              Get.toNamed(AppRoutes.login);
            },
            width: 30.w,
            height: 40.h,
          ),
          width8,
          SmallButton(
            name: "SignUp",
            textColor: AppColors.whiteColor,
            backcolor: AppColors.primaryColor,
            fontSize: 13,
            width: 30.w,
            height: 40.h,
            onclick: () {
              Get.toNamed(AppRoutes.signUp);
            },
          ),
          // width8,
          // ProfileCard()
        ],
      ),
    );
  }
}
