import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/controllers/MenuAppController.dart';
import 'package:admin/app/core/assets/app_images.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:admin/app/screens/compines_details/components/compaines_details_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  final controller = Get.put(MenuAppController());
  final Color backColor;
  Header({Key? key, this.backColor = AppColors.whiteColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backColor,
      child: InnerPadding(
        child: Row(
          children: [
            Image.asset(
              AppImages.logo,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 8,
            ),
            // if (!Responsive.isDesktop(context))
            //   IconButton(
            //     icon: Icon(Icons.menu),
            //     onPressed: controller.controlMenu,
            //   ),

            Text(
              "Reminder App",
              style: AppTextstyle.text10.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 16),
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold),
            ),

            Spacer(),

            // CircleAvatar(
            //   backgroundColor: AppColors.primaryColor,
            //   radius: 23.r,
            //   child: SvgPicture.asset(
            //     AppIcons.notification,
            //     color: AppColors.whiteColor,
            //   ),
            // ),
            CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              backgroundImage: AssetImage(AppImages.profile),
              radius: 23.r,
            ),

            SizedBox(
              width: 8,
            ),
            Obx(
              () => Text(
                controller.userName.value == ""
                    ? ""
                    : controller.userName.value,
                style: AppTextstyle.text10.copyWith(
                    fontSize: FontSizeManager.getFontSize(context, 16),
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 7,
            ),
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
                      value: 'profile',
                      child: itemText(text: "Profile", context: context),
                    ),
                    PopupMenuItem(
                      value: 'logout',
                      child: itemText(text: "Logout", context: context),
                    ),
                  ],
                ).then((value) async {
                  if (value != null) {
                    switch (value) {
                      case 'profile':
                        Get.toNamed(AppRoutes.profile);
                        break;

                      case 'logout':
                        await AppPreferences.removeApiToken();
                        await AppPreferences.removeProjectDetail();
                        await AppPreferences.removeCompaniesCurrentRoute();
                        await AppPreferences.removeserRole();
                        await AppPreferences.removeSetCompanyData();
                        await AppPreferences.removeProjectId();
                        await AppPreferences.removeCompanyId();
                        await AppPreferences.removeUserName();
                        Get.offNamedUntil(AppRoutes.login, (route) => false);
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
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(
        horizontal: 7.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        border: Border.all(color: AppColors.backColor),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16 / 2),
              child: Text(
                "Angelina Jolie",
                style: AppTextstyle.text10.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 16),
                  color: AppColors.whiteColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: AppColors.secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(16 * 0.75),
            margin: EdgeInsets.symmetric(horizontal: 16 / 2),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
