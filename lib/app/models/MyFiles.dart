import '../core/utils/app_colors.dart';
import '../screens/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String title, Total;
  final IconData iconPath;

  final Color? color;

  CloudStorageInfo({
    required this.Total,
    required this.iconPath,
    required this.title,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
      title: "Total Projects",
      color: AppColors.primaryColor,
      iconPath: Icons.notes,
      Total: DashboardController()
          .projectController
          .projectList
          .length
          .toString()),
  CloudStorageInfo(
      title: "Total Task",
      color: AppColors.primaryColor,
      iconPath: Icons.task_outlined,
      Total: DashboardController().taskController.tasksList.length.toString()),
  CloudStorageInfo(
      title: "Total Reminders",
      color: AppColors.primaryColor,
      iconPath: Icons.notification_important_outlined,
      Total: "34"),
  CloudStorageInfo(
      title: "Total Projects",
      color: AppColors.primaryColor,
      iconPath: Icons.notes,
      Total: DashboardController()
          .projectController
          .projectList
          .length
          .toString()),
];
