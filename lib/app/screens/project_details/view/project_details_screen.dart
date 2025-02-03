import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/widgets/taps.dart';
import 'package:admin/app/screens/project_details/components/project_details_header.dart';
import 'package:admin/app/screens/project_details/controller/project_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectDetailsScreen extends GetView<ProjectDetailsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectDetailsController>(
        init: ProjectDetailsController(),
        builder: (controller) {
          return Title(
            title: "Task App",
            color: AppColors.textColor,
            child: Scaffold(
                backgroundColor: AppColors.whiteColor,
                appBar: PreferredSize(
                  child: ProjectDetailsHeader(),
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
                        physics: NeverScrollableScrollPhysics(),
                        controller: controller.pageController,
                        onPageChanged: (int index) {
                          controller.changeIndex(index);
                        },
                        itemCount: projectDetailsTaps.values.length,
                        itemBuilder: (context, index) {
                          switch (projectDetailsTaps.values[index]) {
                            case projectDetailsTaps.Task:
                              return Container();
                            case projectDetailsTaps.Reminders:
                              return Container();
                            case projectDetailsTaps.Settings:
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
