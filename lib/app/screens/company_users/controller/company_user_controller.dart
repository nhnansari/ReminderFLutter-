import '../../../api/api_preference.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../core/widgets/loading.dart';
import '../model/company_user_model.dart';
import '../model/invited_user_model.dart';
import '../respository/company_user_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyUserController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getCompanyUser();
    });
    super.onInit();
  }

  @override
  void onClose() {
    Get.delete<CompanyUserController>();
    super.onClose();
  }

  var headerText = 0.obs;
  void changeHeaderIndex( index) async {
    headerText.value = index;
    if (index == 0) {
      await getCompanyUser();
    } else {
      await getInvitedUser();
    }
  }

  final emailController = TextEditingController();
  var selectedItem = ''.obs;
  CompanyUserRepo companyUserRepo = CompanyUserRepo();

  CompanyUserModel companyUserModel = CompanyUserModel();
  final companyUsers = <CompanyUserData>[].obs;
  InvitedUsersModel invitedUsersModel = InvitedUsersModel();
  final invitedUsers = <InvitedUsersData>[].obs;

  Future<void> getCompanyUser() async {
    try {
      CustomLoading.show();
      final companyId = await AppPreferences.getCompanyId;
      final parameter = "?companyId=$companyId";

      final response =
          await companyUserRepo.getCompanyUser(parameter: parameter);

      if (response != null) {
        companyUserModel = CompanyUserModel.fromJson(response);
        companyUsers.value = companyUserModel.data!;
        CustomLoading.hide();

        // Agar response successful hai, toh success message show karo
      }
    } catch (e) {
      Get.log("Error in get company User $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  Future<void> getInvitedUser() async {
    try {
      CustomLoading.show();
      final companyId = await AppPreferences.getCompanyId;
      final parameter = "?companyId=$companyId";

      final response =
          await companyUserRepo.getInvitedUser(parameter: parameter);

      if (response != null) {
        invitedUsersModel = InvitedUsersModel.fromJson(response);
        invitedUsers.value = invitedUsersModel.data!;

        CustomLoading.hide();

        // Agar response successful hai, toh success message show karo
      }
    } catch (e) {
      Get.log("Error in get invited User $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  void addCompanyUser() async {
    try {
      final companyId = await AppPreferences.getCompanyId.toString();
      final Map<String, dynamic> body = {
        "companyId": companyId,
        "email": emailController.text.trim(),
        "role": selectedItem.value
      };

      CustomLoading.show();
      final response = await companyUserRepo.addCompanyUser(
        body: body,
      );

      if (response != null) {
        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: "Company User Add Successfully");
        await getCompanyUser();
        Get.back();

        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in Add company user $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  void deleteCompanyUser(userId) async {
    try {
      final companyID = await AppPreferences.getCompanyId;

      final body = {"companyId": companyID, "userId": userId};

      CustomLoading.show();
      final response = await companyUserRepo.deleteCompanyUser(body: body);

      if (response != null) {
        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: response["message"]);
        await getCompanyUser();

        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in delete task $e");
    } finally {
      CustomLoading.hide();
    } // clear();
  }

  void cancelInvitation(invitationId) async {
    try {
      final companyID = await AppPreferences.getCompanyId;

      final body = {"companyId": companyID, "invitationId": invitationId};

      CustomLoading.show();
      final response = await companyUserRepo.deleteInvitedUser(body: body);

      if (response != null) {
        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: response["message"]);
        await getInvitedUser();
        await getCompanyUser();

        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in delete inviation $e");
    } finally {
      CustomLoading.hide();
    } // clear();
  }
}
