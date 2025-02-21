// ignore_for_file: invalid_use_of_protected_member
import 'package:reminder_app/app/screens/dashboard/components/header.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_spaces.dart';
import '../../../core/utils/app_textstyle.dart';
import '../../../core/widgets/Custom_container.dart';
import '../../../core/widgets/InnerPadding.dart';
import '../../../core/widgets/small_buttom.dart';
import '../../../responsive.dart';
import '../controller/sunscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubscriptionScreen extends GetView<SubscriptionController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(
        init: SubscriptionController(),
        builder: (controller) => Title(
              color: AppColors.primaryColor,
              title: "Subscriptions",
              child: Scaffold(
                appBar: PreferredSize(
                  child: Header(),
                  preferredSize: Size.fromHeight(60),
                ),
                body: SafeArea(
                  child: Column(children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 15.h),
                        child: Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: AppColors.secondaryColor,
                                  )),
                              height10,
                              if (controller
                                      .currentSubscriptionModel.value.data !=
                                  null) ...[
                                CustomContainer(
                                    borderColor: AppColors.secondaryColor,
                                    backColor: AppColors.whiteColor,
                                    child: InnerPadding(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Current Subscription: ",
                                                  style: AppTextstyle.text10
                                                      .copyWith(
                                                          fontSize:
                                                              FontSizeManager
                                                                  .getFontSize(
                                                                      context,
                                                                      12),
                                                          color: AppColors
                                                              .textColor,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                              Text(
                                                  controller
                                                      .currentSubscriptionModel
                                                      .value
                                                      .data!
                                                      .name
                                                      .toString(),
                                                  style: AppTextstyle
                                                      .text10
                                                      .copyWith(
                                                          fontSize: FontSizeManager
                                                              .getFontSize(
                                                                  context,
                                                                  14),
                                                          color: AppColors
                                                              .primaryColor,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                              Spacer(),
                                              Text(
                                                  "\$${(controller.currentSubscriptionModel.value.data!.amount)! / 100}",
                                                  style: AppTextstyle.text10
                                                      .copyWith(
                                                          fontSize:
                                                              FontSizeManager
                                                                  .getFontSize(
                                                                      context,
                                                                      14),
                                                          color: AppColors
                                                              .primaryColor,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  "Start Date:  ${controller.currentSubscriptionModel.value.data!.startDate!.split("T")[0]}",
                                                  style: AppTextstyle.text10
                                                      .copyWith(
                                                          fontSize:
                                                              FontSizeManager
                                                                  .getFontSize(
                                                                      context,
                                                                      12),
                                                          color: AppColors
                                                              .textColor,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                              Text(
                                                  "End Date:  ${controller.currentSubscriptionModel.value.data!.endDate!.split("T")[0]}",
                                                  style: AppTextstyle.text10
                                                      .copyWith(
                                                          fontSize:
                                                              FontSizeManager
                                                                  .getFontSize(
                                                                      context,
                                                                      12),
                                                          color: AppColors
                                                              .textColor,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                            ],
                                          ),
                                          height6,
                                          Text("Limits: Available / Maximum",
                                              style: AppTextstyle.text10
                                                  .copyWith(
                                                      fontSize: FontSizeManager
                                                          .getFontSize(
                                                              context, 12),
                                                      color:
                                                          AppColors.textColor,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          height8,
                                          _row(
                                              context: context,
                                              text:
                                                  "Admins:   ${controller.currentSubscriptionModel.value.data!.limits!.available!.admins!} / ${controller.currentSubscriptionModel.value.data!.limits!.max!.maxAdmins!}"),
                                          _row(
                                              context: context,
                                              text:
                                                  "Companies:   ${controller.currentSubscriptionModel.value.data!.limits!.available!.companies!} / ${controller.currentSubscriptionModel.value.data!.limits!.max!.maxCompanies!}"),
                                          _row(
                                              context: context,
                                              text:
                                                  "Projects:   ${controller.currentSubscriptionModel.value.data!.limits!.available!.projects!} / ${controller.currentSubscriptionModel.value.data!.limits!.max!.maxProjects!}"),
                                          _row(
                                              context: context,
                                              text:
                                                  "Reminders:  ${controller.currentSubscriptionModel.value.data!.limits!.available!.reminders!} / ${controller.currentSubscriptionModel.value.data!.limits!.max!.maxReminders!}"),
                                          _row(
                                              context: context,
                                              text:
                                                  "Tasks:   ${controller.currentSubscriptionModel.value.data!.limits!.available!.tasks!} / ${controller.currentSubscriptionModel.value.data!.limits!.max!.maxTasks!}"),
                                          _row(
                                              context: context,
                                              text:
                                                  "Workers:   ${controller.currentSubscriptionModel.value.data!.limits!.available!.workers!} / ${controller.currentSubscriptionModel.value.data!.limits!.max!.maxWorkers!}"),
                                        ],
                                      ),
                                    )),
                                height10
                              ],
                              Text("Subscriptions Packages",
                                  style: AppTextstyle.text10.copyWith(
                                      fontSize: FontSizeManager.getFontSize(
                                          context, 18),
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold)),
                              height18,
                              Expanded(
                                child: Obx(
                                  () => controller.subscriptionsPackages.isEmpty
                                      ? InnerPadding(
                                          child: Center(
                                            child: Text(
                                              "No Subscriptions Found!",
                                              style:
                                                  AppTextstyle.text10.copyWith(
                                                fontSize:
                                                    FontSizeManager.getFontSize(
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
                                              // Determine crossAxisCount based on screen width
                                              int crossAxisCount;
                                              if (Responsive.isDesktop(
                                                  context)) {
                                                crossAxisCount = 3;
                                              } else if (Responsive.isTablet(
                                                  context)) {
                                                crossAxisCount = 2;
                                              } else {
                                                crossAxisCount = 1;
                                              }

                                              return GridView.builder(
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  mainAxisExtent:
                                                      Responsive.isMobile(
                                                              context)
                                                          ? 200.h
                                                          : 280.h,
                                                  crossAxisCount:
                                                      crossAxisCount, // Dynamic column count
                                                  crossAxisSpacing:
                                                      10.0, // Space between columns
                                                  mainAxisSpacing:
                                                      10.0, // Space between rows
                                                  // childAspectRatio:
                                                  //     Responsive.isMobile(context)
                                                  //         ? 6 / 2
                                                  //         : Responsive.isTablet(context)
                                                  //             ? 1.7
                                                  //             : 1.6, // Adjust as needed
                                                ),
                                                itemCount: controller
                                                    .subscriptionsPackages
                                                    .value
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  final subscription =
                                                      controller
                                                          .subscriptionsPackages
                                                          .value[index];

                                                  final amount = subscription
                                                      .plans![0].unitAmount;
                                                  final centAMount =
                                                      amount! / 100;

                                                  return InkWell(
                                                    onTap: () {
                                                      // AppPreferences.setProjectDetail(
                                                      //     project.toJson());
                                                      // Get.toNamed(
                                                      //     AppRoutes.projectDetailScreen);
                                                      // // Navigate to project details
                                                    },
                                                    child: CustomContainer(
                                                      borderColor: AppColors
                                                          .primaryColor,
                                                      backColor:
                                                          AppColors.whiteColor,
                                                      child: InnerPadding(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        subscription
                                                                            .product!
                                                                            .name
                                                                            .toString(),
                                                                        style: AppTextstyle
                                                                            .text10
                                                                            .copyWith(
                                                                          fontSize: FontSizeManager.getFontSize(
                                                                              context,
                                                                              15),
                                                                          color:
                                                                              AppColors.textColor,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        subscription
                                                                            .product!
                                                                            .description
                                                                            .toString(),
                                                                        style: AppTextstyle
                                                                            .text10
                                                                            .copyWith(
                                                                          fontSize: FontSizeManager.getFontSize(
                                                                              context,
                                                                              12),
                                                                          color:
                                                                              AppColors.textColor,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "\$${centAMount}",
                                                                  style: AppTextstyle
                                                                      .text10
                                                                      .copyWith(
                                                                    fontSize: FontSizeManager
                                                                        .getFontSize(
                                                                            context,
                                                                            15),
                                                                    color: AppColors
                                                                        .backColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              "Features:",
                                                              style:
                                                                  AppTextstyle
                                                                      .text10
                                                                      .copyWith(
                                                                fontSize: FontSizeManager
                                                                    .getFontSize(
                                                                        context,
                                                                        12),
                                                                color: AppColors
                                                                    .textColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            _row(
                                                                context:
                                                                    context,
                                                                text:
                                                                    "Admin: ${subscription.product!.metadata!.admins ?? ""}"),
                                                            _row(
                                                                context:
                                                                    context,
                                                                text:
                                                                    "Compines: ${subscription.product!.metadata!.companies ?? ""}"),
                                                            _row(
                                                                context:
                                                                    context,
                                                                text:
                                                                    "Projects: ${subscription.product!.metadata!.projects ?? ""}"),
                                                            _row(
                                                                context:
                                                                    context,
                                                                text:
                                                                    "Reminders: ${subscription.product!.metadata!.reminders ?? ""}"),
                                                            _row(
                                                                context:
                                                                    context,
                                                                text:
                                                                    "Tasks: ${subscription.product!.metadata!.tasks ?? ""}"),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                SmallButton(
                                                                  onclick: () {
                                                                    controller.planCheckOut(
                                                                        planId: controller
                                                                            .subscriptionsPackages[index]
                                                                            .plans![0]
                                                                            .id
                                                                            .toString());
                                                                  },
                                                                  name: "Buy",
                                                                  width: 70,
                                                                  backcolor:
                                                                      AppColors
                                                                          .backColor,
                                                                  textColor:
                                                                      AppColors
                                                                          .whiteColor,
                                                                )
                                                              ],
                                                            )
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
                      ),
                    )
                  ]),
                ),
              ),
            ));
  }
}

Widget _row({text, context}) {
  return Row(
    children: [
      Icon(
        Icons.checklist_rounded,
        color: AppColors.primaryColor,
        size: 15.h,
      ),
      width4,
      Text(
        text,
        style: AppTextstyle.text10.copyWith(
          fontSize: FontSizeManager.getFontSize(context, 11),
          color: AppColors.greyColor,
        ),
      ),
    ],
  );
}
