import '../../../routes/app_routes.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  void logout() async {
    // await AppPreferences.removeApiToken();
    // await AppPreferences.removeAppAuthQrCode();

    // await AppPreferences.removeCompaniesCurrentRoute();
    // await AppPreferences.removeCurrentRoute();
    // await AppPreferences.removeDeviceToken();

    // await AppPreferences.removeSetCompanyData();
    // await AppPreferences.removeUserEmail();
    // await AppPreferences.removeUserId();
    Get.offNamedUntil(AppRoutes.login, (route) => false);
  }
}
