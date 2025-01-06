import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/core/widgets/custom_snackbar.dart';
import 'package:admin/app/core/widgets/loading.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:admin/app/screens/reset_password/repository/reset_password_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final currentIndex = 0.obs;
  final newPasswordObscure = true.obs;
  final confirmPasowordObscure = true.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController otpController = TextEditingController();

  final ResetPasswordRepository resetPasswordRepository =
      ResetPasswordRepository();

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void setObsureText(RxBool obscure) {
    obscure.value = !obscure.value;
  }

  @override
  void dispose() {
    emailController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    otpController.dispose();
    super.dispose();
  }

  void VarifyOtp() async {
    try {
      final Map<String, dynamic> body = {
        "session": AppPreferences.getVarifySession,
        "token": otpController.text.trim()
      };

      CustomLoading.show();
      final response = await resetPasswordRepository.varifyOtp(
        body: body,
      );

      if (response != null && response['message'] != null) {
        // Show success message if response is successful
        AppPreferences.setOtp(otpController.text.trim());
        CustomSnackBar.show(message: response['message']);
        changeIndex(2);
      }
    } catch (e) {
      CustomLoading.hide();
      CustomSnackBar.show(
        message: "Failed to varify Otp. Error: ${e.toString()}",
      );
    } finally {
      CustomLoading.hide();
    }
  }

  void verifyPassRequest() async {
    try {
      final Map<String, dynamic> body = {"email": emailController.text.trim()};
      CustomLoading.show();

      final response = await resetPasswordRepository.forgetPass(body: body);

      if (response != null && response['message'] != null) {
        final session = response["session"];
        AppPreferences.setVarifySession(session);
        CustomLoading.hide();
        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: response['message']);
        changeIndex(1);
      }
    } catch (e) {
      CustomLoading.hide();

      CustomSnackBar.show(
          message: "Failed to Verify Email. Error: ${e.toString()}");
    } finally {
      CustomLoading.hide();
    }
  }

  void setResetPassword() async {
    try {
      final Map<String, dynamic> body = {
        "session": AppPreferences.getVarifySession,
        "token": AppPreferences.getOtp,
        "newPassword": newPasswordController.text.trim(),
        "confirmPassword": confirmPasswordController.text.trim()
      };
      CustomLoading.show();

      final response = await resetPasswordRepository.resetPassword(body: body);

      if (response != null && response['message'] != null) {
        CustomLoading.hide();
        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: response['message']);
        Get.offAllNamed(AppRoutes.login);
      }
    } catch (e) {
      CustomLoading.hide();

      CustomSnackBar.show(
          message: "Failed to Set reset password. Error: ${e.toString()}");
    } finally {
      CustomLoading.hide();
    }
  }

  // void ResendCode({required context}) async {
  //   try {
  //     final Map<String, dynamic> body = {
  //       "email": AppPreferences.getUserEmail,
  //     };
  //     CustomLoading.show();
  //     final response =
  //         await resetPasswordRepository.ResetPassRequest(body: body);

  //     if (response != null && response['message'] != null) {
  //       CustomLoading.hide();
  //       // Get.log('User Email = $email');

  //       // Agar response successful hai, toh success message show karo
  //       CustomSnackBar.show(message: response['message']);
  //       changeIndex(1);
  //     }
  //   } catch (e) {
  //     CustomLoading.hide();

  //     CustomSnackBar.show(
  //         message: "Failed to Rest password. Error: ${e.toString()}");
  //   } finally {
  //     CustomLoading.hide();
  //   }
  // }
}
