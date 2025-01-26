import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/screens/compines_details/controller/compaines_datails_controller.dart.dart';
import 'package:admin/app/screens/project_details/controller/project_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum projectDetailsTaps { Task, Reminders, Settings }

enum companyTaps {
  Dashboard,
  Projects,
  Employees,
  Team,
  Task,
  Reminders,
  Settings,
  Custom_Messages,
}

class MainTaps extends StatelessWidget {
  final controller = Get.put(ProjectDetailsController());
  MainTaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        projectDetailsTaps.values.length,
                        (index) => Obx(
                              () => InkWell(
                                onTap: () {
                                  controller.changeIndex(index);
                                },
                                borderRadius: BorderRadius.circular(10),
                                child: Column(
                                  children: [
                                    height8,
                                    Text(
                                      projectDetailsTaps.values[index].name,
                                      style: AppTextstyle.text10.copyWith(
                                          fontSize: FontSizeManager.getFontSize(
                                              context, 13),
                                          color: AppColors.textColor),
                                    ),
                                    height10,
                                    Container(
                                      color: controller
                                                  .currentScreen.value.index ==
                                              index
                                          ? AppColors.backColor
                                          : AppColors.transparentColor,
                                      height: 1.5,
                                      width: (projectDetailsTaps
                                                  .values[index].name.length *
                                              12)
                                          .toDouble(),
                                    )
                                  ],
                                ),
                              ),
                            )),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 1,
          color: AppColors.greyColor,
        )
      ],
    );
  }
}

class CompainesTap extends StatelessWidget {
  final companiesController = Get.put(CompainesDetailsController());
  CompainesTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        companyTapsList.length,
                        (index) => Obx(
                              () => InkWell(
                                onTap: () {
                                  companiesController.changeIndex(index);
                                },
                                borderRadius: BorderRadius.circular(10),
                                child: Column(
                                  children: [
                                    height8,
                                    Text(
                                      companyTapsList[index],
                                      style: AppTextstyle.text10.copyWith(
                                          fontSize: FontSizeManager.getFontSize(
                                              context, 13),
                                          color: companiesController
                                                      .currentScreen
                                                      .value
                                                      .index ==
                                                  index
                                              ? AppColors.textColor
                                              : AppColors.greyColor),
                                    ),
                                    height6,
                                    Container(
                                      color: companiesController
                                                  .currentScreen.value.index ==
                                              index
                                          ? AppColors.backColor
                                          : AppColors.transparentColor,
                                      height: 1.5,
                                      width:
                                          (companyTapsList[index].length * 12)
                                              .toDouble(),
                                    )
                                  ],
                                ),
                              ),
                            )),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 1,
          color: AppColors.greyColor,
        )
      ],
    );
  }
}

List<String> companyTapsList = [
  "Dashboard",
  "Projects",
  "Employees",
  "Team ",
  "Task",
  "Reminders",
  "Settings",
  "Custom Messages",
];
