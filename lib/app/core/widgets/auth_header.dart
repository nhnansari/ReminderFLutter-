import '../assets/app_images.dart';
import '../utils/app_colors.dart';
import '../utils/app_textstyle.dart';

import 'small_buttom.dart';
import '../../responsive.dart';
import '../../routes/app_routes.dart';
import '../../screens/compines_details/components/compaines_details_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          color: AppColors.whiteColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // if (!Responsive.isDesktop(context))

              Image.asset(
                AppImages.logo,
                height: 50.h,
                width: 50,
                fit: BoxFit.cover,
              ),
              if (!Responsive.isMobile(context)) ...[
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  "Home",
                  style: AppTextstyle.text10.copyWith(
                    fontSize: FontSizeManager.getFontSize(context, 12),
                    color: AppColors.textColor,
                  ),
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  "Features",
                  style: AppTextstyle.text10.copyWith(
                    fontSize: FontSizeManager.getFontSize(context, 12),
                    color: AppColors.textColor,
                  ),
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  "About",
                  style: AppTextstyle.text10.copyWith(
                    fontSize: FontSizeManager.getFontSize(context, 12),
                    color: AppColors.textColor,
                  ),
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  "Contact",
                  style: AppTextstyle.text10.copyWith(
                    fontSize: FontSizeManager.getFontSize(context, 12),
                    color: AppColors.textColor,
                  ),
                ),
              ],
              Spacer(),
              if (!Responsive.isMobile(context)) ...[
                SmallButton(
                  name: " Login ",
                  textColor: AppColors.textColor,
                  borderColor: AppColors.textColor,
                  backcolor: AppColors.whiteColor,
                  fontSize: 13,
                  width: 100,
                  onclick: () {
                    Get.toNamed(AppRoutes.login);
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                SmallButton(
                  name: "SignUp",
                  textColor: AppColors.whiteColor,
                  borderColor: AppColors.textColor,
                  backcolor: AppColors.textColor,
                  fontSize: 13,
                  width: 100,
                  onclick: () {
                    Get.toNamed(AppRoutes.signUp);
                  },
                ),
              ],
              if (Responsive.isMobile(context))
                IconButton(
                  iconSize: 26,
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    showMenu(
                        color: AppColors.secondaryColor,
                        context: context,
                        position: RelativeRect.fromLTRB(
                            50.0, 50.0, 0.0, 0.0), // Position of the menu
                        items: [
                          PopupMenuItem(
                              value: 'login',
                              child: itemText(text: "Login", context: context)),
                          PopupMenuItem(
                              value: 'signUp',
                              child:
                                  itemText(text: "Sign Up", context: context)),
                        ]).then((value) async {
                      // Handle item selection
                      if (value != null) {
                        switch (value) {
                          case 'login':
                            Get.toNamed(AppRoutes.login);

                            // Navigate to Profile screen or perform an action
                            break;
                          case 'signUp':
                            Get.toNamed(AppRoutes.signUp);

                            // Navigate to Subscriptions screen or perform an action
                            break;
                        }
                      }
                    });
                  },
                ),
              // width8,
              // ProfileCard()
            ],
          ),
        ),
        Divider(
          thickness: 0.5,
          height: 1,
          color: AppColors.lightBack,
        )
      ],
    );
  }
}
