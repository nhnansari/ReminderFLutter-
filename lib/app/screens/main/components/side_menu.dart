import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/controllers/MenuAppController.dart';
import 'package:admin/app/core/assets/app_icons.dart';
import 'package:admin/app/core/assets/app_images.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  final controller = Get.put(MenuAppController());
  SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.secondaryColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(AppImages.img1),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: AppIcons.dashboard,
            press: () => controller.changeIndex(0),
          ),
          DrawerListTile(
            title: "Companies",
            svgSrc: AppIcons.transaction,
            press: () {},
          ),
          DrawerListTile(
            title: "Projects",
            svgSrc: AppIcons.task,
            press: () {},
          ),
          DrawerListTile(
            title: "Team",
            svgSrc: AppIcons.documents,
            press: () => controller.changeIndex(1),
          ),
          DrawerListTile(
            title: "Reports",
            svgSrc: AppIcons.store,
            press: () {},
          ),
          DrawerListTile(
            title: "Reminders",
            svgSrc: AppIcons.notification,
            press: () {},
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: AppIcons.profile,
            press: () {},
          ),
          DrawerListTile(
            title: "Subscriptions",
            svgSrc: AppIcons.settings,
            press: () {},
          ),
          DrawerListTile(
            title: "Logout",
            svgSrc: AppIcons.logout,
            press: () async {
              await AppPreferences.removeApiToken();
              await AppPreferences.removeUserId();
              await AppPreferences.removeVarifySession();

              await AppPreferences.removeUserEmail();
              await AppPreferences.removeOtp();

              Get.offAllNamed(AppRoutes.login);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
