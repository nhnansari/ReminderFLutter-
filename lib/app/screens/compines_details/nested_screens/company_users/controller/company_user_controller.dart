import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/core/widgets/custom_snackbar.dart';
import 'package:admin/app/core/widgets/loading.dart';
import 'package:admin/app/screens/compines_details/nested_screens/company_users/respository/company_user_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyUserController extends GetxController {
  
  final emailController = TextEditingController();
  var selectedItem = ''.obs;
  CompanyUserRepo companyUserRepo = CompanyUserRepo();

  void addCompanyUser() async {
    try {
      final companyId = await AppPreferences.getCompanyId.toString();
      final Map<String, dynamic> body = {
        "companyId":companyId,
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
        // await getCompanies();
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
}
