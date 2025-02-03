import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/core/assets/app_images.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:admin/app/screens/project_details/controller/project_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProjectDetailsHeader extends StatelessWidget {
  final controller = Get.put(ProjectDetailsController());

  ProjectDetailsHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: InnerPadding(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
// if (!Responsive.isDesktop(context))

            SizedBox(
              width: 8,
            ),
            Image.asset(
              AppImages.logo,
              height: 60.h,
              width: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 8,
            ),

            Text(
              "Reminder App",
              style: AppTextstyle.text10.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 16),
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold),
            ),

            SizedBox(
              width: 8,
            ),
            Text(
              " > Project > ",
              style: AppTextstyle.text10.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 15),
                  color: AppColors.textColor,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${controller.projectModel.value.name.toString()}",
              style: AppTextstyle.text10.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 14),
                  color: AppColors.textColor,
                  fontWeight: FontWeight.normal),
            ),
            Spacer(),
            if (!Responsive.isMobile(context))
              CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                backgroundImage: AssetImage(AppImages.profile),
                radius: 23,
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
                        child: itemText(text: "Profile", context: context)),
                    PopupMenuItem(
                        value: 'subscriptions',
                        child:
                            itemText(text: "Subscriptions", context: context)),
                    PopupMenuItem(
                        value: 'switch_company',
                        child:
                            itemText(text: "Switch Company", context: context)),
                    PopupMenuItem(
                        value: 'switch_project',
                        child:
                            itemText(text: "Switch Project", context: context)),
                    PopupMenuItem(
                        value: 'logout',
                        child: itemText(text: "Logout", context: context)),
                  ],
                ).then((value) async {
                  // Handle item selection
                  if (value != null) {
                    switch (value) {
                      case 'profile':

                        // Navigate to Profile screen or perform an action
                        break;
                      case 'subscriptions':

                        // Navigate to Subscriptions screen or perform an action
                        break;
                      case 'switch_company':
                        Get.offAndToNamed(AppRoutes.companies);
                        // Handle switch company logic
                        break;
                      case 'switch_project':
                        Get.offAllNamed(AppRoutes.compainesDetails);
                        // Handle switch company logic
                        break;
                      case 'logout':
                        await AppPreferences.removeApiToken();
                        await AppPreferences.removeProjectDetail();

                        await AppPreferences.removeCompaniesCurrentRoute();
                        await AppPreferences.removeProjectRoute();
                        await AppPreferences.removeDeviceToken();

                        await AppPreferences.removeSetCompanyData();
                        await AppPreferences.removeProjectId();
                        await AppPreferences.removeCompanyId();
                        Get.offAllNamed(AppRoutes.login);
                        // Handle logout logic
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

Widget itemText({required String text, context}) {
  return Text(
    text,
    style: AppTextstyle.text10.copyWith(
        fontSize: FontSizeManager.getFontSize(context, 13),
        color: AppColors.whiteColor,
        fontWeight: FontWeight.normal),
  );
}
