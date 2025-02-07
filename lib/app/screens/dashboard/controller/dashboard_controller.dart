import 'package:admin/app/screens/compines_details/nested_screens/project/controller/project_controller.dart';
import 'package:admin/app/screens/task/controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await projectController.getProjects();
      await taskController.getTasks();
      
    });
    super.onInit();
  }

  final projectController = Get.put(ProjectController());
  final taskController = Get.put(TaskController());
  // final reminderController = Get.put(Remind());
}
