// ignore_for_file: invalid_use_of_protected_member

import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/core/assets/app_images.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/Custom_container.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:admin/app/screens/companies/components/add_dailog.dart';
import 'package:admin/app/screens/companies/controller/companies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompainesScreen extends GetView<CompaniesController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompaniesController>(
      init: CompaniesController(),
      builder: (controller) => Column(children: [
        Expanded(
          child: InnerPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                height18,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Companies",
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
                              builder: (context) => AddDailog());
                        })
                  ],
                ),
                height18,
                Expanded(
                  child: SingleChildScrollView(
                    child: Obx(
                      () => controller.companies.value.isEmpty
                          ? InnerPadding(
                              child: Center(
                                child: Text("No Company Found!",
                                    style: AppTextstyle.text10.copyWith(
                                        fontSize: FontSizeManager.getFontSize(
                                            context, 14),
                                        color: AppColors.backColor,
                                        fontWeight: FontWeight.normal)),
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                  controller.companies.value.length,
                                  (index) => InkWell(
                                        onTap: () {
                                          AppPreferences.setSetCompanyData(
                                              controller.companies.value[index]
                                                  .toJson());
                                         


                                          
                                          

                                          Get.toNamed(
                                              AppRoutes.compainesDetails,
                                              );
                                        },
                                        child: CustomContainer(
                                            boxConstraints:
                                                BoxConstraints(maxWidth: 150.w),
                                            borderColor: AppColors.primaryColor,
                                            margin: EdgeInsets.only(bottom: 10),
                                            backColor: AppColors.whiteColor,
                                            child: InnerPadding(
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                      maxRadius: 20.r,
                                                      child: controller
                                                                  .companies
                                                                  .value[index]
                                                                  .logo !=
                                                              null
                                                          ? Center(
                                                              child: Text(controller
                                                                  .companies
                                                                  .value[index]
                                                                  .name!
                                                                  .substring(
                                                                      0, 1)
                                                                  .toUpperCase()),
                                                            )
                                                          : Image(
                                                              image: AssetImage(
                                                                AppImages
                                                                    .profile,
                                                              ),
                                                            )),
                                                  VerticalDivider(),
                                                  Text(
                                                      controller.companies
                                                          .value[index].name!,
                                                      style: AppTextstyle
                                                          .text10
                                                          .copyWith(
                                                              fontSize:
                                                                  FontSizeManager
                                                                      .getFontSize(
                                                                          context,
                                                                          14),
                                                              color: AppColors
                                                                  .textColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                  // VerticalDivider(),
                                                  // SmallButton(
                                                  //   name: "Go To Company",
                                                  //   backcolor: AppColors.secondaryColor,
                                                  //   textColor: AppColors.whiteColor,
                                                  //   onclick: () {
                                                  //     Get.offAllNamed(AppRoutes.main);
                                                  //   },
                                                  // )
                                                ],
                                              ),
                                            )),
                                      )),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
