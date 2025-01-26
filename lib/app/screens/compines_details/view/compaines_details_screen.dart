import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/widgets/taps.dart';
import 'package:admin/app/screens/compines_details/components/compaines_details_header.dart';
import 'package:admin/app/screens/compines_details/controller/compaines_datails_controller.dart.dart';
import 'package:admin/app/screens/compines_details/nested_screens/company_users/view/company_user_screen.dart';
import 'package:admin/app/screens/compines_details/nested_screens/project/view/project_screen.dart';
import 'package:admin/app/screens/compines_details/nested_screens/setting/view/setting_screen.dart';
import 'package:admin/app/screens/compines_details/nested_screens/team/view/team_screen.dart';
import 'package:admin/app/screens/custom_messages/view/custom_messages_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompainesDetailsScreen extends GetView<CompainesDetailsController> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompainesDetailsController>(
        init: CompainesDetailsController(),
        builder: (controller) {
          return Title(
            title: "Task App",
            color: AppColors.textColor,
            child: Scaffold(
                key: scaffoldKey,
                backgroundColor: AppColors.whiteColor,
                appBar: PreferredSize(
                  child: CompainesDetailsHeader(
                    scaffoldKey: scaffoldKey,
                  ),
                  preferredSize: Size.fromHeight(60),
                ),
                // drawer: CustomDrawer(),
                // drawer: SideMenu(),
                body: SafeArea(
                    child: Column(
                  children: [
                    CompainesTap(),
                    height10,
                    Expanded(
                      child: PageView.builder(
                        controller: controller.pageController,
                        onPageChanged: (int index) {
                          controller.changeIndex(index);
                        },
                        itemCount: companyTaps.values.length,
                        itemBuilder: (context, index) {
                          switch (companyTaps.values[index]) {
                            case companyTaps.Employees:
                              return CompanyUserScreen();
                            case companyTaps.Projects:
                              return ProjectScreen();
                            case companyTaps.Team:
                              return TeamScreen();
                            case companyTaps.Settings:
                              return SettingScreen();
                            case companyTaps.Dashboard:
                              return Container();
                            case companyTaps.Reminders:
                              return Container();
                            case companyTaps.Task:
                              return Container();
                            case companyTaps.Custom_Messages:
                              return CustomMessagesScreen();

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
