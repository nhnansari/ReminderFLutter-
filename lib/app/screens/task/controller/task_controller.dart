import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/widgets/custom_snackbar.dart';
import 'package:admin/app/core/widgets/loading.dart';
import 'package:admin/app/screens/compines_details/nested_screens/project/controller/project_controller.dart';
import 'package:admin/app/screens/task/model/task_model.dart';
import 'package:admin/app/screens/task/respository/task_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getTasks();
    });
    super.onInit();
  }

  final nameController = TextEditingController();
  final descController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  var selectedProjectId = "".obs;

  final projectController = Get.put(ProjectController());
  final _startDate = Rx<DateTime?>(null);
  final _endDate = Rx<DateTime?>(null);

  DateTime? get startDate => _startDate.value;
  DateTime? get endDate => _endDate.value;

  TaskRepo taskRepo = TaskRepo();
  TasksModel tasksModel = TasksModel();
  var tasksList = <TasksModelData>[].obs;

  Future<void> pickStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      _startDate.value = picked;
      startDateController.text = DateFormat("yyyy-MM-dd").format(picked);

      // Reset the end date if it's earlier than the new start date
      if (_endDate.value != null && _endDate.value!.isBefore(picked)) {
        _endDate.value = null;
        endDateController.clear();
      }
    }
  }

  Future<void> getTasks() async {
    try {
      final companyId = await AppPreferences.getCompanyId;
      final parameter = "?companyId=$companyId";
      CustomLoading.show();
      final response = await taskRepo.getTasks(parameter: parameter);

      if (response != null) {
        tasksModel = TasksModel.fromJson(response);
        tasksList.value = tasksModel.data!;
        CustomLoading.hide();

        // Agar response successful hai, toh success message show karo
      }
    } catch (e) {
      Get.log("Error in get task $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  Future<void> pickEndDate(BuildContext context) async {
    if (_startDate.value == null) {
      Get.snackbar(
        'Error',
        'Please select a start date first.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate.value ?? _startDate.value!,
      firstDate: _startDate.value!,
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      _endDate.value = picked;
      endDateController.text = DateFormat("yyyy-MM-dd").format(picked);
    }
  }

  void clear() {
    nameController.clear();
    descController.clear();
    startDateController.clear();
    endDateController.clear();
    selectedProjectId.value = "";
  }

  void editTask(TasksModelData index) {
    nameController.text = index.name ?? ""; // Handle null safely
    descController.text = index.description ?? "";
    startDateController.text = index.createdAt?.split("T")[0] ?? "";
    endDateController.text = index.dueDate?.split("T")[0] ?? "";
    selectedProjectId.value = index.project!.id.toString();
  }

  void createTask() async {
    if (selectedProjectId.value.isEmpty) {
      CustomSnackBar.show(
          message: "Project Required !\nCreate you project first",
          backColor: AppColors.errorColor);
    } else {
      final companyId = await AppPreferences.getCompanyId;
      final projectId = selectedProjectId.value;
      try {
        final Map<String, dynamic> body = {
          "name": nameController.text.trim(),
          "description": descController.text.trim(),
          "projectId": int.parse(projectId),
          "companyId": int.parse(companyId),
          "assignedUser": null,
          "assignedTeam": null,
          "dueDate": endDateController.text.trim(),
          "startDate": startDateController.text.trim(),
          "priority": 1
        };

        CustomLoading.show();
        final response = await taskRepo.createTask(
          body: body,
        );

        if (response != null) {
          // Agar response successful hai, toh success message show karo
          CustomSnackBar.show(message: "Task Created Successfully");
          await getTasks();
          Get.back();
          clear();

          CustomLoading.hide();
        }
      } catch (e) {
        Get.log("Error in create project $e");
      } finally {
        CustomLoading.hide();
        // clear();
      }
    }
  }

  void updateMsg(taskId) async {
    final companyId = await AppPreferences.getCompanyId;
    final projectId = selectedProjectId.value;
    final parameter = "/$taskId";
    try {
      final Map<String, dynamic> body = {
        "name": nameController.text.trim(),
        "description": descController.text.trim(),
        "projectId": int.parse(projectId),
        "companyId": int.parse(companyId),
        "assignedUser": null,
        "assignedTeam": null,
        "dueDate": endDateController.text.trim(),
        "startDate": startDateController.text.trim(),
        "priority": 1
      };

      CustomLoading.show();
      final response = await taskRepo.updatetask(
        parameter: parameter,
        body: body,
      );

      if (response != null) {
        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: response["message"]);
        await getTasks();
        Get.back();

        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in update task $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  void deleteTask(taskId) async {
    try {
      final companyID = await AppPreferences.getCompanyId;

      final parameter = "/$taskId?companyId=$companyID";

      CustomLoading.show();
      final response = await taskRepo.deleteTask(
        parameter: parameter,
      );

      if (response != null) {
        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: response["message"]);
        await getTasks();

        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in delete task $e");
    } finally {
      CustomLoading.hide();
    } // clear();
  }
}
