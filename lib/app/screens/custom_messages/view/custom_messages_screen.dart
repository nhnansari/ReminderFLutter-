// ignore_for_file: invalid_use_of_protected_member
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/Custom_container.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/dotted_divider.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/screens/custom_messages/components/add_custom_msg_dailog.dart';
import 'package:admin/app/screens/custom_messages/controller/custom_messages_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomMessagesScreen extends GetView<CustomMessagesController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomMessagesController>(
        init: CustomMessagesController(),
        builder: (controller) => Title(
              color: AppColors.primaryColor,
              title: "Custom Messages",
              child: Column(children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Custom Messages",
                                style: AppTextstyle.text10.copyWith(
                                    fontSize: FontSizeManager.getFontSize(
                                        context, 18),
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold)),
                            SmallButton(
                                name: "Add New",
                                textColor: AppColors.whiteColor,
                                backcolor: AppColors.secondaryColor,
                                onclick: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          AddCustomMessageDialog());
                                })
                          ],
                        ),
                        height18,
                        Expanded(
                          child: SingleChildScrollView(
                            child: Obx(
                              () => controller.customsMsgs.value.isEmpty
                                  ? InnerPadding(
                                      child: Center(
                                        child: Text("No Messages Found!",
                                            style: AppTextstyle.text10.copyWith(
                                                fontSize:
                                                    FontSizeManager.getFontSize(
                                                        context, 14),
                                                color: AppColors.whiteColor,
                                                fontWeight: FontWeight.normal)),
                                      ),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                          controller.customsMsgs.length,
                                          (index) => InkWell(
                                                onTap: () {
                                                  // Get.toNamed(
                                                  //     AppRoutes.compainesDetails);
                                                },
                                                child: CustomContainer(
                                                    borderColor:
                                                        AppColors.backColor,
                                                    margin: EdgeInsets.only(
                                                        bottom: 10),
                                                    backColor:
                                                        AppColors.whiteColor,
                                                    child: InnerPadding(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  controller
                                                                      .customsMsgs[
                                                                          index]
                                                                      .message
                                                                      .toString(),
                                                                  style: AppTextstyle.text10.copyWith(
                                                                      fontSize: FontSizeManager.getFontSize(
                                                                          context,
                                                                          13),
                                                                      color: AppColors
                                                                          .textColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              Spacer(),
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    controller.deleteMsg(controller
                                                                        .customsMsgs[
                                                                            index]
                                                                        .id);
                                                                  },
                                                                  icon: Icon(
                                                                    Icons
                                                                        .delete,
                                                                    color: AppColors
                                                                        .errorColor,
                                                                  )),
                                                              IconButton(
                                                                  onPressed:
                                                                      () async {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder: (context) =>
                                                                            AddCustomMessageDialog(
                                                                              options: controller.customsMsgs.value[index],
                                                                            ));
                                                                  },
                                                                  icon: Icon(
                                                                    Icons.edit,
                                                                    color: AppColors
                                                                        .secondaryColor,
                                                                  )),
                                                            ],
                                                          ),
                                                          height10,
                                                          if (controller
                                                              .customsMsgs
                                                              .value
                                                              .isNotEmpty)
                                                            ...List.generate(
                                                                controller
                                                                    .customsMsgs[
                                                                        index]
                                                                    .options!
                                                                    .length,
                                                                (index1) =>
                                                                    Padding(
                                                                      padding: EdgeInsets.only(
                                                                          bottom:
                                                                              10),
                                                                      child: _row(
                                                                          context:
                                                                              context,
                                                                          text: controller
                                                                              .customsMsgs[
                                                                                  index]
                                                                              .options![
                                                                                  index1]
                                                                              .option,
                                                                          status: controller
                                                                              .customsMsgs[index]
                                                                              .options![index1]
                                                                              .nature),
                                                                    ))
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
            ));
  }
}

Widget _row({text, status, context}) {
  return Row(
    children: [
      Text(text,
          style: AppTextstyle.text10.copyWith(
            fontSize: FontSizeManager.getFontSize(context, 11),
            color: AppColors.greyColor,
          )),
      width4,
      Expanded(
        child: DottedDivider(
          color: AppColors.greyColor, // Use your existing AppColors
          height: 1.0, // Adjust thickness
          dashWidth: 5.0, // Width of each dash
          dashSpace: 4.0, // Space between dashes
        ),
      ),
      width4,
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.backColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          status,
          style: AppTextstyle.text10.copyWith(
            fontSize: FontSizeManager.getFontSize(context, 12),
            color: AppColors.textColor,
          ),
        ),
      ),
    ],
  );
}
