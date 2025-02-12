import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  void logout() async {
    await AppPreferences.removeCompaniesCurrentRoute();

    await AppPreferences.removeSetCompanyData();
    // await AppPreferences.removeProjectRoute();

    Get.offAndToNamed(AppRoutes.companies);
  }
}
