import '../../../api/api_preference.dart';
import '../../../core/assets/app_images.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_textstyle.dart';
import '../../../core/widgets/InnerPadding.dart';
import '../../../core/widgets/taps.dart';
import '../../../responsive.dart';
import '../../../routes/app_routes.dart';
import '../controller/compaines_datails_controller.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompainesDetailsHeader extends StatelessWidget {
  final controller = Get.put(CompaniesDetailsController());
  final GlobalKey<ScaffoldState> scaffoldKey;

  CompainesDetailsHeader({
    Key? key,
    required this.scaffoldKey,
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
              " > ",
              style: AppTextstyle.text10.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 17),
                  color: AppColors.textColor,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${controller.companiesModel.value.name.toString()}",
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
                        child: itemText(text: "Profile", context: context),
                      ),
                      PopupMenuItem(
                        value: 'subscriptions',
                        child:
                            itemText(text: "Subscriptions", context: context),
                      ),
                      PopupMenuItem(
                        value: 'switch_company',
                        child:
                            itemText(text: "Switch Company", context: context),
                      ),
                      PopupMenuItem(
                        value: 'logout',
                        child: itemText(text: "Logout", context: context),
                      ),
                    ]).then((value) async {
                  if (value != null) {
                    switch (value) {
                      case 'profile':
                        controller.isWorker.value == "admin"
                            ? controller
                                .changeIndex(companyAdminTaps.Profile.index)
                            : controller
                                .changeIndex(companyWorkerTaps.Profile.index);
                        break;
                      case 'subscriptions':
                        Get.toNamed(AppRoutes.subscriptions);

                        break;
                      case 'switch_company':
                        Get.offAllNamed(AppRoutes.companies);
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

Widget itemText({required String text, context}) {
  return Text(
    text,
    style: AppTextstyle.text10.copyWith(
        fontSize: FontSizeManager.getFontSize(context, 13),
        color: AppColors.whiteColor,
        fontWeight: FontWeight.normal),
  );
}
