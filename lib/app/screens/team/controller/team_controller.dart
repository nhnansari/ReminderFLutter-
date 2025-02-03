import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/core/widgets/custom_snackbar.dart';
import 'package:admin/app/core/widgets/loading.dart';
import 'package:admin/app/screens/company_users/controller/company_user_controller.dart';
import 'package:admin/app/screens/team/model/team_model.dart';
import 'package:admin/app/screens/team/respository/team_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getTeams();
    });
    super.onInit();
  }

  final nameController = TextEditingController();
  final descController = TextEditingController();

  final workerController = Get.put(CompanyUserController());
  TeamRepo teamRepo = TeamRepo();
  TeamModel teamModel = TeamModel();
  var teams = <TeamData>[].obs;
  var selectedWorkerID = ''.obs;

  Future<void> getTeams() async {
    try {
      final companyId = await AppPreferences.getCompanyId;
      final parameter = "?companyId=$companyId";
      CustomLoading.show();
      final response = await teamRepo.getTeams(parameter: parameter);

      if (response != null) {
        teamModel = TeamModel.fromJson(response);
        teams.value = teamModel.data!;
        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in get team $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  void clear() {
    nameController.clear();
    descController.clear();
  }

  void addTeam() async {
    final companyId = await AppPreferences.getCompanyId;

    try {
      final Map<String, dynamic> body = {
        "name": nameController.text.trim(),
        "description": descController.text.trim(),
        "companyId": int.parse(companyId)
      };

      CustomLoading.show();
      final response = await teamRepo.addTeam(
        body: body,
      );

      if (response != null) {
        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: "team Created Successfully");
        await getTeams();
        Get.back();
        clear();

        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in create team $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  void addWorker({
    teamId,
    workerId,
  }) async {
    final companyId = await AppPreferences.getCompanyId;

    final parameter = "/$teamId/members";

    try {
      final Map<String, dynamic> body = {
        "userId": workerId,
        "companyId": int.parse(companyId)
      };

      CustomLoading.show();
      final response =
          await teamRepo.addWorker(body: body, parameter: parameter);

      if (response != null) {
        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: response["message"]);
        await getTeams();
        Get.back();

        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in add worker $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  // void updateMsg(teamId) async {
  //   final companyId = await AppPreferences.getCompanyId;
  //   final projectId = selectedProjectId.value;
  //   final parameter = "/$teamId";
  //   try {
  //     final Map<String, dynamic> body = {
  //       "name": nameController.text.trim(),
  //       "description": descController.text.trim(),
  //       "projectId": int.parse(projectId),
  //       "companyId": int.parse(companyId),
  //       "assignedUser": null,
  //       "assignedTeam": null,
  //       "dueDate": endDateController.text.trim(),
  //       "startDate": startDateController.text.trim(),
  //       "priority": 1
  //     };

  //     CustomLoading.show();
  //     final response = await teamRepo.updateteam(
  //       parameter: parameter,
  //       body: body,
  //     );

  //     if (response != null) {
  //       // Agar response successful hai, toh success message show karo
  //       CustomSnackBar.show(message: response["message"]);
  //       await getTeams();
  //       Get.back();

  //       CustomLoading.hide();
  //     }
  //   } catch (e) {
  //     Get.log("Error in update team $e");
  //   } finally {
  //     CustomLoading.hide();
  //     // clear();
  //   }
  // }

  void deleteteam(teamId) async {
    try {
      final companyID = await AppPreferences.getCompanyId;

      final parameter = "/$teamId?companyId=$companyID";

      CustomLoading.show();
      final response = await teamRepo.deleteTeam(
        parameter: parameter,
      );

      if (response != null) {
        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: response["message"]);
        await getTeams();

        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in delete team $e");
    } finally {
      CustomLoading.hide();
    } // clear();
  }
}
