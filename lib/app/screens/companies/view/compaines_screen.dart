// ignore_for_file: invalid_use_of_protected_member

import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/core/assets/app_images.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/Custom_container.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:admin/app/screens/companies/components/add_dailog.dart';
import 'package:admin/app/screens/companies/controller/companies_controller.dart';
import 'package:admin/app/screens/dashboard/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompainesScreen extends GetView<CompaniesController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompaniesController>(
      init: CompaniesController(),
      builder: (controller) => Scaffold(
        appBar: PreferredSize(
          child: Header(),
          preferredSize: Size.fromHeight(60),
        ),
        body: Column(children: [
          Divider(
            color: AppColors.secondaryColor,
          ),
          Expanded(
            child: InnerPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Companies",
                          style: AppTextstyle.text10.copyWith(
                              fontSize:
                                  FontSizeManager.getFontSize(context, 18),
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold)),
                      SmallButton(
                          name: "Add New",
                          textColor: AppColors.whiteColor,
                          backcolor: AppColors.secondaryColor,
                          onclick: () {
                            showDialog(
                                context: context,
                                builder: (context) => AddDailog());
                          })
                    ],
                  ),
                  height18,
                  Expanded(
                    child: Obx(
                      () => controller.companies.value.isEmpty
                          ? InnerPadding(
                              child: Center(
                                child: Text(
                                  "No Company Found!",
                                  style: AppTextstyle.text10.copyWith(
                                    fontSize: FontSizeManager.getFontSize(
                                        context, 14),
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
                                  // Determine crossAxisCount based on screen size
                                  int crossAxisCount;
                                  if (Responsive.isDesktop(context)) {
                                    crossAxisCount =
                                        3; // 3 items per row on Desktop
                                  } else if (Responsive.isTablet(context)) {
                                    crossAxisCount =
                                        2; // 2 items per row on Tablet
                                  } else {
                                    crossAxisCount =
                                        1; // 1 item per row on Mobile
                                  }

                                  return GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          crossAxisCount, // Dynamic column count
                                      crossAxisSpacing:
                                          10.0, // Space between columns
                                      mainAxisSpacing:
                                          10.0, // Space between rows
                                      childAspectRatio:
                                          4 / 1, // Adjust width/height ratio
                                    ),
                                    itemCount:
                                        controller.companies.value.length,
                                    itemBuilder: (context, index) {
                                      final company =
                                          controller.companies.value[index];
                                      return InkWell(
                                        onTap: () {
                                          AppPreferences.setSetCompanyData(
                                              company.toJson());
                                          Get.toNamed(
                                              AppRoutes.compainesDetails);
                                        },
                                        child: CustomContainer(
                                          boxConstraints:
                                              BoxConstraints(maxWidth: 150.w),
                                          borderColor: AppColors.primaryColor,
                                          margin: EdgeInsets.zero,
                                          backColor: AppColors.whiteColor,
                                          child: InnerPadding(
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  maxRadius: 20.r,
                                                  child: company.logo != null
                                                      ? Center(
                                                          child: Text(
                                                            company.name!
                                                                .substring(0, 1)
                                                                .toUpperCase(),
                                                          ),
                                                        )
                                                      : Image(
                                                          image: AssetImage(
                                                              AppImages
                                                                  .profile),
                                                        ),
                                                ),
                                                VerticalDivider(
                                                  color: AppColors
                                                      .transparentColor,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    company.name!,
                                                    style: AppTextstyle.text10
                                                        .copyWith(
                                                      fontSize: FontSizeManager
                                                          .getFontSize(
                                                              context, 14),
                                                      color:
                                                          AppColors.textColor,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
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
      ),
    );
  }
}
