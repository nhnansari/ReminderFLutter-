// ignore_for_file: unnecessary_null_comparison


import 'package:admin/app/core/widgets/custom_snackbar.dart';
import 'package:admin/app/core/widgets/loading.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:admin/app/screens/invitation_varification/repository/invitation_varification_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvitationVarificationController extends GetxController {
  final obscure = true.obs;

  final formKey = GlobalKey<FormState>();
  InvitationVarificationRepository invitationVarificationRepository = InvitationVarificationRepository();

  TextEditingController emailcontroller = TextEditingController();

  // MFAModel mfaModel = MFAModel();
  TextEditingController otpController = TextEditingController();

  void setObsureText() {
    obscure.value = !obscure.value;
  }

  void clear() {
    emailcontroller.clear();
    otpController.clear();
  }

   @override
  void onInit() {
    super.onInit();
    clear();
    _fetchEmailAndCodeFromUrl();
  }
 void _fetchEmailAndCodeFromUrl() {
    final String expectedRoute = "/join/invitationVarification";
    final Uri? uri = Get.currentRoute != null ? Uri.tryParse(Get.currentRoute) : null;
    if (uri != null && uri.path == expectedRoute) {
      final String? email = uri.queryParameters["email"];
      final String? code = uri.queryParameters["code"];
      if (email != null && code != null) {
        emailcontroller.text = email;
        otpController.text = code;
      }
    } else {
      Get.log("Invalid route for invitation verification");
    }
  }
  void acceptInvitation() async {
    try {
      final Map<String, dynamic> body = {
        "email": emailcontroller.text.trim(),
        "verificationCode": otpController.text.trim()
      };

      // Show loading indicator
      CustomLoading.show();

      // Make login request
      final response = await invitationVarificationRepository.acceptInvitation(
        body: body,
      );

      // Check if response has required data
      if (response != null 
         ) {
      

        // Check for MFA requirement
       

        

        CustomSnackBar.show(message: response["message"]);
        Get.offAllNamed(AppRoutes.compainesDetails);
        clear();
      
      }
      Get.log((response != null).toString());
    } catch (e) {
      Get.log("Failed to accept invitation ${e.toString()}");

      
    } finally {
      CustomLoading.hide();
    }
  }

}
