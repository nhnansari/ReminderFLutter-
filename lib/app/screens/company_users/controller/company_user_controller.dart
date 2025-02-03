import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/core/widgets/custom_snackbar.dart';
import 'package:admin/app/core/widgets/loading.dart';
import 'package:admin/app/screens/company_users/model/company_user_model.dart';
import 'package:admin/app/screens/company_users/respository/company_user_repo.dart';
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

  final emailController = TextEditingController();
  var selectedItem = ''.obs;
  CompanyUserRepo companyUserRepo = CompanyUserRepo();

  CompanyUserModel companyUserModel = CompanyUserModel();
  var companyUsers = <CompanyUserData>[].obs;

  Future<void> getCompanyUser() async {
    try {
      final companyId = await AppPreferences.getCompanyId;
      final parameter = "?companyId=$companyId";
      CustomLoading.show();
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
      final response =
          await companyUserRepo.deleteCompanyUser(body: body);

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
}
