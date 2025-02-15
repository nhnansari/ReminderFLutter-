import '../../../api/api_preference.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../core/widgets/loading.dart';
import '../../../routes/app_routes.dart';
import '../repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final obscure = true.obs;
  final ischeck = false.obs;
  final formKey = GlobalKey<FormState>();
  LoginRepository loginRepository = LoginRepository();

  TextEditingController emailcontroller = TextEditingController();

  // MFAModel mfaModel = MFAModel();
  TextEditingController passwordcontroller = TextEditingController();

  void setObsureText() {
    obscure.value = !obscure.value;
  }

  void clear() {
    emailcontroller.clear();
    passwordcontroller.clear();
  }

  @override
  void onInit() {
    clear();
    super.onInit();
  }

  void loginUser({required BuildContext context}) async {
    try {
      final Map<String, dynamic> body = {
        "email": emailcontroller.text.trim(),
        "password": passwordcontroller.text.trim()
      };

      // Show loading indicator
      CustomLoading.show();

      // Make login request
      final response = await loginRepository.LoginUser(
        body: body,
      );

      // Check if response has required data
      if (response != null &&
          response['user'] != null &&
          response['token'] != null) {
        final token = response['token'];

        // Check for MFA requirement
        await AppPreferences.setApiToken(token);
     
        await AppPreferences.setUserName(response['user']['fullName']);
        Get.log("Login Token: $token");

        Get.offAllNamed(AppRoutes.companies);

        CustomSnackBar.show(message: "Login Successfully");
        clear();
        Get.log((response['user'] != null).toString());
        Get.log((response['user']['token'] != null).toString());
      }
      Get.log((response != null).toString());
    } catch (e) {
      Get.log("Failed to Login. Error: ${e.toString()}");

      CustomSnackBar.show(message: "An error occured,please try again");
    } finally {
      CustomLoading.hide();
    }
  }

  // Future<void> getMfaList({ontext}) async {
  //   try {
  //     CustomLoading.show();
  //     final response = await loginRepository.getMFA();
  //     if (response != null && response['data'] != null) {
  //       mfaModel = MFAModel.fromJson(response);
  //       Get.log(mfaModel.data!.method!.length.toString());
  //       for (var element in mfaModel.data!.method!) {
  //         if (element.name == "email") {
  //           if (element.userEnabled == true) {
  //             Get.offAllNamed(AppRoutes.emailVarification, arguments: true);
  //           } else {
  //             Get.offAllNamed(
  //               AppRoutes.index,
  //             );
  //           }
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     CustomLoading.hide();
  //     Get.log("Failed to Get Mfa List. Error: ${e.toString()}");
  //   } finally {
  //     CustomLoading.hide();
  //   }
  // }
}
