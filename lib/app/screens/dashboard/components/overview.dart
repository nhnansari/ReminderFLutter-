// ignore_for_file: invalid_use_of_protected_member

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_spaces.dart';
import '../../../core/utils/app_textstyle.dart';
import '../../../responsive.dart';
import '../controller/dashboard_controller.dart';
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
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 130.h),
          itemCount: 4,
          itemBuilder: (context, index) {
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
                "total": controller.total_reminders.value.toString()
              },
              {
                "title": "Total Completed",
                "icon": Icons.check_circle,
                "total": controller.total_tasks.value.toString()
              },
            ].obs;

            return Obx(
              () => FileInfoCard(
                title: overviewItems.value[index]["title"] as String,
                iconPath: overviewItems.value[index]["icon"] as IconData,
                Total: overviewItems.value[index]["total"] as String,
              ),
            );
          },
        ),
      ],
    );
  }
}
