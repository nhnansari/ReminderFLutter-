import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_spaces.dart';
import '../../../core/widgets/taps.dart';
import '../components/compaines_details_header.dart';
import '../controller/compaines_datails_controller.dart.dart';
import '../../company_users/view/company_user_screen.dart';
import '../../profile/screens/profile_screen.dart';
import '../../project/view/project_screen.dart';
import '../../setting/view/setting_screen.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../../reminders/view/reminder_screen.dart';
import '../../team/view/team_screen.dart';
import '../../custom_messages/view/custom_messages_screen.dart';
import '../../subscription/view/subscription_screen.dart';
import '../../task/view/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompainesDetailsScreen extends GetView<CompaniesDetailsController> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompaniesDetailsController>(
        init: CompaniesDetailsController(),
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
                        itemCount: controller.isWorker.value == "admin"
                            ? companyAdminTaps.values.length
                            : companyWorkerTaps.values.length,
                        itemBuilder: (context, index) {
                          switch (controller.isWorker.value == "admin"
                              ? companyAdminTaps.values[index]
                              : companyWorkerTaps.values[index]) {
                            case companyAdminTaps.Employees:
                              return CompanyUserScreen();
                            case companyAdminTaps.Projects:
                              return ProjectScreen();
                            case companyAdminTaps.Team:
                              return TeamScreen();
                            case companyAdminTaps.Settings:
                              return SettingScreen();
                            case companyAdminTaps.Dashboard:
                              return DashboardScreen();
                            case companyAdminTaps.Reminders:
                              return ReminderScreen();
                            case companyAdminTaps.Subscriptions:
                              return SubscriptionScreen();
                            case companyAdminTaps.Task:
                              return TaskScreen();
                            case companyAdminTaps.Custom_Messages:
                              return CustomMessagesScreen();

                            case companyAdminTaps.Profile:
                              return ProfileScreen();
                          }
                          return null;
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
