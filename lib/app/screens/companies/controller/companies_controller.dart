import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/core/widgets/custom_snackbar.dart';
import 'package:admin/app/core/widgets/loading.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:admin/app/screens/companies/model/companies_model.dart';
import 'package:admin/app/screens/companies/model/my_role_model.dart';
import 'package:admin/app/screens/companies/respository/companies_repo.dart';
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
    } catch (e) {
      Get.log("Error in register company $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }
}
