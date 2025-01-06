import 'package:admin/app/core/widgets/custom_snackbar.dart';
import 'package:admin/app/core/widgets/loading.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:admin/app/screens/sign_up/repository/signup_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final obscure = true.obs; // For password field visibility
  final obscureConfirm = true.obs; // For confirm password field visibility
  // final ischeck = false.obs;

  final isloading = false.obs;
  // final isAccIdExist = false.obs;
  SignUpRepository signUpRepository = SignUpRepository();
  // var refId = ''.obs;
  // Text controllers for form fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  // TextEditingController sponsorIDController = TextEditingController();
  // final profileModel = ProfileModel().obs;

  void clear() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
  }

  @override
  void onInit() {
    clear();
    super.onInit();
  }

  void setObsureText() {
    obscure.value = !obscure.value;
  }

  // void _checkAndStoreReferralId() {
  //   if (kIsWeb) {
  //     final uri = Uri.base; // Current URL
  //     final refId = uri.queryParameters['ref'];

  //     if (refId != null && refId.isNotEmpty && refId != "null") {
  //       _setCookie("ref_id", refId);
  //       Get.log("refId  : $refId");
  //     }
  //   }
  // }

  // void _setCookie(String key, String value) {
  //   if (GetPlatform.isWeb) {
  //     final expirationDate = DateTime.now().add(Duration(days: 30));
  //     html.document.cookie =
  //         "$key=$value; expires=${expirationDate.toUtc().toIso8601String()}; path=/";
  //   }
  // }

  // Future<void> getRefId() async {
  //   try {
  //     final cookieValue = await _getCookie("ref_id");

  //     if (cookieValue != null &&
  //         cookieValue.isNotEmpty &&
  //         cookieValue != "null") {
  //       refId.value = cookieValue;
  //       final response = await getUserDataBYAccId(refId.value);
  //       if (response != null) {
  //         profileModel.value = ProfileModel.fromJson(response);
  //         update();
  //         isAccIdExist.value = true;
  //       } // Safely assign value
  //       sponsorIDController.text = refId.value;

  //       if (kDebugMode) {
  //         print("Referral ID: $refId");
  //       }
  //     } else {
  //       if (kDebugMode) {
  //         print("Referral ID not found or is empty.");
  //       }
  //     }
  //   } catch (e) {
  //     Get.log("Error in  getUserDataByAccId  in get ref id from ccokies : $e");
  //   } finally {
  //     CustomLoading.hide();
  //   }

  //   // Fetch the ref_id from cookies
  // }

  // /// Get a value from cookies
  // Future<String?> _getCookie(String key) async {
  //   if (kIsWeb) {
  //     var cookies = html.document.cookie?.split(';');
  //     if (cookies != null) {
  //       for (var cookie in cookies) {
  //         var cookiePair = cookie.split('=');
  //         if (cookiePair[0].trim() == key) {
  //           return cookiePair[1];
  //         }
  //       }
  //     }
  //   }
  //   return null; // Ensure null safety
  // }

  void signUpUser() async {
    try {
      final Map<String, dynamic> body = {
        "email": emailController.text.trim(),
        "fullName": nameController.text.trim(),
        "password": passwordController.text.trim()
      };

      CustomLoading.show();
      final response = await signUpRepository.SignUpUser(
        body: body,
      );

      if (response != null) {
        CustomLoading.hide();

        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: "User Created Successfully");

        Get.offAndToNamed(
          AppRoutes.login,
        );
        clear();
      }
    } catch (e) {
      Get.log(e.toString());
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  // Future<dynamic> getUserDataBYAccId(String refId) async {
  //   try {
  //     CustomLoading.show();
  //     final parameter = refId;

  //     final response =
  //         await signUpRepository.getDataByAccId(parameter: parameter);
  //     return response;
  //   } catch (e) {
  //     Get.log("Error in  getUserDataByAccId  : $e");
  //   } finally {
  //     CustomLoading.hide();
  //   }
  // }
}
