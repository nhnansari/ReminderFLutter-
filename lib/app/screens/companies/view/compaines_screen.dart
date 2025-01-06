import 'package:admin/app/core/assets/app_images.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/Custom_container.dart';
import 'package:admin/app/core/widgets/auth_header.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/responsive.dart';
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
        builder: (controller) => Scaffold(
              backgroundColor: AppColors.whiteColor,
              body: SafeArea(
                  child: Column(children: [
                if (Responsive.isDesktop(context)) AuthHeader(),
                !Responsive.isDesktop(context) ? height18 : height6,
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 13.w, vertical: 15.h),
                    child: Column(
                      children: [
                        Text("Choose Company",
                            style: AppTextstyle.text10.copyWith(
                                fontSize:
                                    FontSizeManager.getFontSize(context, 18),
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold)),
                        height18,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SmallButton(
                                name: "Register To New Company",
                                textColor: AppColors.whiteColor,
                                backcolor: AppColors.primaryColor,
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
                              () => Column(
                                children: controller.companies.isEmpty
                                    ? [
                                        Center(
                                          child: Text("No Company Found!",
                                              style: AppTextstyle.text10
                                                  .copyWith(
                                                      fontSize: FontSizeManager
                                                          .getFontSize(
                                                              context, 14),
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                        )
                                      ]
                                    : List.generate(
                                        controller.companies.length,
                                        (index) => CustomContainer(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 11.w,
                                                vertical: 10.h),
                                            margin: EdgeInsets.only(bottom: 10),
                                            backColor: AppColors.secondaryColor,
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  maxRadius: 25.r,
                                                  backgroundImage: controller
                                                              .companies[index]
                                                              .logo !=
                                                          null
                                                      ? NetworkImage(controller
                                                          .companies[index]
                                                          .logo!)
                                                      : AssetImage(
                                                          AppImages.profile,
                                                        ),
                                                ),
                                                VerticalDivider(),
                                                Expanded(
                                                  child: Text(
                                                      controller
                                                          .companies[index]
                                                          .name!,
                                                      style: AppTextstyle.text10.copyWith(
                                                          fontSize:
                                                              FontSizeManager
                                                                  .getFontSize(
                                                                      context,
                                                                      14),
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                ),
                                                VerticalDivider(),
                                                SmallButton(
                                                  name: "Go To Company",
                                                  backcolor:
                                                      AppColors.primaryColor,
                                                  textColor:
                                                      AppColors.whiteColor,
                                                  onclick: () {
                                                    Get.offAllNamed(
                                                        AppRoutes.main);
                                                  },
                                                )
                                              ],
                                            ))),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ])),
            ));
  }
}
