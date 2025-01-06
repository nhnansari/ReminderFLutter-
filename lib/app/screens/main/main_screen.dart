import 'package:admin/app/controllers/MenuAppController.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/screens/dashboard/components/header.dart';
import 'package:admin/app/screens/dashboard/components/recent_files.dart';
import 'package:admin/app/screens/dashboard/view/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/side_menu.dart';

class MainScreen extends GetView<MenuAppController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuAppController>(
        init: MenuAppController(),
        builder: (controller) {
          return Title(
            title: "Task App",
            color: AppColors.textColor,
            child: Scaffold(
                backgroundColor: AppColors.backColor,
                key: controller.scaffoldKey,
                appBar: PreferredSize(
                  child: Header(),
                  preferredSize: Size.fromHeight(60),
                ),
                drawer: SideMenu(),
                body: SafeArea(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // We want this side menu only for large screen
                        if (Responsive.isDesktop(context))
                          Expanded(
                            // default flex = 1
                            // and it takes 1/6 part of the screen
                            child: SideMenu(),
                          ),

                        Expanded(
                          // It takes 5/6 part of the screen
                          flex: 5,
                          child: controller.selectedIndex == 0
                              ? DashboardScreen()
                              : RecentFiles(),
                        ),
                      ]),
                )),
          );
        });
  }
}
