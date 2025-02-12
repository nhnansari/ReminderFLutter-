// ignore_for_file: invalid_use_of_protected_member

import 'package:admin/app/screens/project/controller/project_controller.dart';
import 'package:admin/app/screens/reminders/controller/reminder_controller.dart';
import 'package:admin/app/screens/task/controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await projectController.getProjects();
      await taskController.getTasks();
      await reminderController.getMyReminders();
      total_projects.value = projectController.projectList.value.length;
      total_tasks.value = taskController.tasksList.value.length;
      total_reminders.value = reminderController.reminders.value.length;
      refresh();
    });
    super.onInit();
  }

  final projectController = Get.put(ProjectController());
  final taskController = Get.put(TaskController());
  final reminderController = Get.put(ReminderController());
  final total_projects = 0.obs;
  final total_tasks = 0.obs;
  final total_reminders = 0.obs;
  // final reminderController = Get.put(Remind());
}
