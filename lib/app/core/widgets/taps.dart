import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/screens/compines_details/controller/compaines_datails_controller.dart.dart';
import 'package:admin/app/screens/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum dashboardTaps { Dashboard, Companies, Profile, Settings, Logout }

enum companyTaps {
  Overview,
  Users,
  Jobs,
  Project,
  Reminders,
  Team,
  Subscription,
  Report
}

class MainTaps extends StatelessWidget {
  final controller = Get.put(MainController());
  MainTaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      dashboardTaps.values.length,
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
                                    dashboardTaps.values[index].name,
                                    style: AppTextstyle.text10.copyWith(
                                        fontSize: FontSizeManager.getFontSize(
                                            context, 13),
                                        color: AppColors.textColor),
                                  ),
                                  height10,
                                  Container(
                                    color:
                                        controller.currentScreen.value.index ==
                                                index
                                            ? AppColors.backColor
                                            : AppColors.transparentColor,
                                    height: 1.5,
                                    width: (dashboardTaps
                                                .values[index].name.length *
                                            12)
                                        .toDouble(),
                                  )
                                ],
                              ),
                            ),
                          )),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      companyTaps.values.length,
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
                                    companyTaps.values[index].name,
                                    style: AppTextstyle.text10.copyWith(
                                        fontSize: FontSizeManager.getFontSize(
                                            context, 13),
                                        color: AppColors.textColor),
                                  ),
                                  height10,
                                  Container(
                                    color: companiesController
                                                .currentScreen.value.index ==
                                            index
                                        ? AppColors.backColor
                                        : AppColors.transparentColor,
                                    height: 1.5,
                                    width:
                                        (companyTaps.values[index].name.length *
                                                12)
                                            .toDouble(),
                                  )
                                ],
                              ),
                            ),
                          )),
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

// List<String> dashboardTaps = [
  
// ];

