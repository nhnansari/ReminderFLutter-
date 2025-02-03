import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/Custom_container.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/screens/compines_details/nested_screens/project/components/add_project_dailog.dart';
import 'package:admin/app/screens/compines_details/nested_screens/project/controller/project_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProjectScreen extends GetView<ProjectController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectController>(
      init: ProjectController(),
      builder: (controller) => Column(children: [
        Expanded(
          child: InnerPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Projects",
                        style: AppTextstyle.text10.copyWith(
                            fontSize: FontSizeManager.getFontSize(context, 18),
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold)),
                    SmallButton(
                        name: "Add New",
                        textColor: AppColors.whiteColor,
                        backcolor: AppColors.secondaryColor,
                        onclick: () {
                          showDialog(
                              context: context,
                              builder: (context) => AddProjectDailog());
                        })
                  ],
                ),
                height18,
                Expanded(
                  child: Obx(
                    () => controller.projectList.isEmpty
                        ? InnerPadding(
                            child: Center(
                              child: Text(
                                "No Project Found!",
                                style: AppTextstyle.text10.copyWith(
                                  fontSize:
                                      FontSizeManager.getFontSize(context, 14),
                                  color: AppColors.backColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                // Determine crossAxisCount based on screen width
                                int crossAxisCount;
                                if (Responsive.isDesktop(context)) {
                                  crossAxisCount = 3;
                                } else if (Responsive.isTablet(context)) {
                                  crossAxisCount = 2;
                                } else {
                                  crossAxisCount = 1;
                                }

                                return GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        crossAxisCount, // Dynamic column count
                                    crossAxisSpacing:
                                        10.0, // Space between columns
                                    mainAxisSpacing: 10.0, // Space between rows
                                    childAspectRatio:
                                        Responsive.isMobile(context)
                                            ? 6 / 2
                                            : Responsive.isMobile(context)
                                                ? 6 / 2
                                                : 4 / 2, // Adjust as needed
                                  ),
                                  itemCount: controller.projectList.length,
                                  itemBuilder: (context, index) {
                                    final project =
                                        controller.projectList[index];
                                    return InkWell(
                                      onTap: () async {
                                        await AppPreferences.setProjectId(
                                            project.id);

                                        await AppPreferences.setProjectDetail(
                                            project.toJson());
                                        // Get.toNamed(
                                        //     AppRoutes.projectDetailScreen);
                                        // // Navigate to project details
                                      },
                                      child: CustomContainer(
                                        borderColor: AppColors.primaryColor,
                                        backColor: AppColors.whiteColor,
                                        child: InnerPadding(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    maxRadius: 15.r,
                                                    child: Center(
                                                      child: Text(
                                                        project.name!
                                                            .substring(0, 1)
                                                            .toUpperCase(),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 8),
                                                  Expanded(
                                                    child: Text(
                                                      project.name!,
                                                      style: AppTextstyle.text10
                                                          .copyWith(
                                                        fontSize:
                                                            FontSizeManager
                                                                .getFontSize(
                                                                    context,
                                                                    14),
                                                        color:
                                                            AppColors.textColor,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                project.description!,
                                                style: AppTextstyle.text10
                                                    .copyWith(
                                                  fontSize: FontSizeManager
                                                      .getFontSize(context, 12),
                                                  color: AppColors.backColor,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
