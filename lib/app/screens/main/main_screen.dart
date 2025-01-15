import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/widgets/taps.dart';
import 'package:admin/app/screens/companies/view/compaines_screen.dart';
import 'package:admin/app/screens/dashboard/components/header.dart';
import 'package:admin/app/screens/dashboard/view/dashboard_screen.dart';
import 'package:admin/app/screens/logout/view/logout_screen.dart';
import 'package:admin/app/screens/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          return Title(
            title: "Task App",
            color: AppColors.textColor,
            child: Scaffold(
                backgroundColor: AppColors.whiteColor,
                appBar: PreferredSize(
                  child: Header(),
                  preferredSize: Size.fromHeight(60),
                ),
                // drawer: SideMenu(),
                body: SafeArea(
                    child: Column(
                  children: [
                    MainTaps(),
                    height10,
                    Expanded(
                      child: PageView.builder(
                        controller: controller.pageController,
                        onPageChanged: (int index) {
                          controller.changeIndex(index);
                        },
                        itemCount: dashboardTaps.values.length,
                        itemBuilder: (context, index) {
                          switch (dashboardTaps.values[index]) {
                            case dashboardTaps.Dashboard:
                              return DashboardScreen();
                            case dashboardTaps.Companies:
                              return CompainesScreen();
                            case dashboardTaps.Profile:
                              return Container();
                            case dashboardTaps.Settings:
                              return Container();

                            case dashboardTaps.Logout:
                              return LogoutScreen();
                            default:
                              return Container();
                          }
                        },
                      ),
                    )
                  ],
                )

                    //  Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       // We want this side menu only for large screen
                    //       if (Responsive.isDesktop(context))
                    //         Expanded(
                    //           // default flex = 1
                    //           // and it takes 1/6 part of the screen
                    //           child: SideMenu(),
                    //         ),

                    //       Expanded(
                    //         // It takes 5/6 part of the screen
                    //         flex: 5,
                    //         child: controller.selectedIndex == 0
                    //             ? DashboardScreen()
                    //             : RecentFiles(),
                    //       ),
                    //     ]),
                    )),
          );
        });
  }
}
