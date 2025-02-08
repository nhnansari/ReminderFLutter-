// ignore_for_file: invalid_use_of_protected_member

import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/screens/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'file_info_card.dart';

class Overview extends StatelessWidget {
  final controller = Get.put(DashboardController());

  Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLarge = Responsive.isDesktop(context);
    int crossAxisCount = isLarge ? 4 : 2;

    final overviewItems = [
      {
        "title": "Total Projects",
        "icon": Icons.note,
        "total": controller.total_projects.value.toString(),
      },
      {
        "title": "Total Task",
        "icon": Icons.task_rounded,
        "total": controller.total_tasks.value.toString()
      },
      {
        "title": "Total Reminder",
        "icon": Icons.notifications,
        "total": controller.total_tasks.value.toString()
      },
      {
        "title": "Total Completed",
        "icon": Icons.check_circle,
        "total": controller.total_tasks.value.toString()
      },
    ].obs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Overview",
          style: AppTextstyle.text10.copyWith(
            fontSize: FontSizeManager.getFontSize(context, 20),
            fontWeight: FontWeight.bold,
            color: AppColors.backColor,
          ),
        ),
        height16,
        Obx(
          () => GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 130.h),
            itemCount: overviewItems.value.length,
            itemBuilder: (context, index) {
              return FileInfoCard(
                title: overviewItems.value[index]["title"] as String,
                iconPath: overviewItems.value[index]["icon"] as IconData,
                Total: overviewItems.value[index]["total"] as String,
              );
            },
          ),
        ),
      ],
    );
  }
}
