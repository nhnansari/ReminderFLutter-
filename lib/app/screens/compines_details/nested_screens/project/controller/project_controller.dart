import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/core/widgets/custom_snackbar.dart';
import 'package:admin/app/core/widgets/loading.dart';
import 'package:admin/app/screens/compines_details/nested_screens/project/model/project_model.dart';
import 'package:admin/app/screens/compines_details/nested_screens/project/respository/project_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProjectController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getProjects();
    });
    super.onInit();
  }

  final nameController = TextEditingController();
  final descController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  final _startDate = Rx<DateTime?>(null);
  final _endDate = Rx<DateTime?>(null);

  DateTime? get startDate => _startDate.value;
  DateTime? get endDate => _endDate.value;

  ProjectRepo projectRepo = ProjectRepo();
  ProjectListModel projectListModel = ProjectListModel();
  var projectList = <ProjectListData>[].obs;

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

  Future<void> getProjects() async {
    try {
      final companyId = await AppPreferences.getCompanyId;
      final parameter = "?companyId=$companyId";
      CustomLoading.show();
      final response = await projectRepo.getProjects(parameter: parameter);

      if (response != null) {
        projectListModel = ProjectListModel.fromJson(response);
        projectList.value = projectListModel.data!;
        CustomLoading.hide();

        // Agar response successful hai, toh success message show karo
      }
    } catch (e) {
      Get.log("Error in get project $e");
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
  }

  void createProject() async {
    final companyId = await AppPreferences.getCompanyId;
    try {
      final Map<String, dynamic> body = {
        "name": nameController.text.trim(),
        "description": descController.text.trim(),
        "companyId": companyId,
        "startDate": startDateController.text.trim(),
        "endDate": endDateController.text.trim()
      };

      CustomLoading.show();
      final response = await projectRepo.createProject(
        body: body,
      );

      if (response != null) {
        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: "Project Created Successfully");
        await getProjects();
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
