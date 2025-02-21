import 'dart:math';

import 'package:http/http.dart';
import 'package:reminder_app/app/screens/subscription/controller/sunscription_controller.dart';

import '../../../api/api_preference.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../core/widgets/loading.dart';
import '../../../routes/app_routes.dart';
import '../model/companies_model.dart';
import '../model/my_role_model.dart';
import '../respository/companies_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CompaniesController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getCompanies();
    });
    super.onInit();
  }

  var companiesModel = CompaniesModel().obs;
  var myRoleModel = MyRoleModel().obs;
  CompaniesRepo companiesRepo = CompaniesRepo();
  RxList<Company> companies = <Company>[].obs;

  final nameController = TextEditingController();
  final subscriptionCotroller = Get.put(SubscriptionController());
  final subDomainController = TextEditingController();
  final urlController = TextEditingController();

  Future<void> getCompanies() async {
    try {
      CustomLoading.show();
      final response = await companiesRepo.getCompanies();

      if (response != null) {
        companiesModel.value = CompaniesModel.fromJson(response);
        companies.value = companiesModel.value.companies;
        CustomLoading.hide();

        // Agar response successful hai, toh success message show karo
      }
    } catch (e) {
      Get.log("Error in get company $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  Future<void> getMyRole(Company company) async {
    try {
      final paramter = "?companyId=${company.id}";
      CustomLoading.show();

      final response = await companiesRepo.getMyRole(parameter: paramter);

      if (response != null) {
        myRoleModel.value = MyRoleModel.fromJson(response);

        await AppPreferences.setCompanyId(company.id!);
        await AppPreferences.setSetCompanyData(company.toJson());
        await AppPreferences.setUserRole(myRoleModel.value.roleName);

        Get.toNamed(AppRoutes.compainesDetails);
        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in get my role $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  void registerCompany() async {
    try {
      if (subscriptionCotroller.currentSubscriptionModel.value.data != null) {
        final Map<String, dynamic> body = {
          "name": nameController.text.trim(),
          "logo": ""
        };

        CustomLoading.show();
        final response = await companiesRepo.registerCompany(
          body: body,
        );

        if (response != null) {
          // Agar response successful hai, toh success message show karo
          CustomSnackBar.show(message: "Company Register Successfully");
          await getCompanies();
          Get.back();

          CustomLoading.hide();
        }
      } else {
        CustomSnackBar.show(
            message:
                "You don't have any subscription, please purchase the subscription");
        Get.toNamed(AppRoutes.subscriptions);
      }
    } catch (e) {
      Get.log("Error in register company $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }
}
