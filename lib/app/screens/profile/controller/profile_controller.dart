import 'package:admin/app/core/widgets/custom_snackbar.dart';
import 'package:admin/app/core/widgets/loading.dart';
import 'package:admin/app/screens/profile/model/profile_model.dart';
import 'package:admin/app/screens/profile/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  ProfileRepository profileRepository = ProfileRepository();

  TextEditingController oldPasswordController = TextEditingController();
  final oldPasswordObscure = true.obs;
  final newPasswordObscure = true.obs;
  final confirmPasswordObscure = true.obs;

  void setObscure(RxBool obscureField) {
    obscureField.value = !obscureField.value;
  }

  // MFAModel mfaModel = MFAModel();

  final profileModel = ProfileModel().obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void clear() {
    oldPasswordController.clear();
    nameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void onInit() {
    clear();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getProfile();
    });

    super.onInit();
  }

  void updateProfile() async {
    try {
      final Map<String, dynamic> body = {
        "name": nameController.text.trim(),
        "oldPassword": oldPasswordController.text.trim(),
        "newPassword": passwordController.text.trim(),
        "confirmPassword": confirmPasswordController.text.trim()
      };

      // Show loading indicator
      CustomLoading.show();

      // Make login request
      final response = await profileRepository.updateProfile(
        body: body,
      );

      // Check if response has required data
      if (response != null) {
        CustomSnackBar.show(message: response["message"]);
        clear();
        await getProfile();
      }
    } catch (e) {
      Get.log("Failed to update profile ${e.toString()}");
    } finally {
      CustomLoading.hide();
    }
  }

  Future<void> getProfile() async {
    try {
      // Show loading indicator
      CustomLoading.show();

      // Make login request
      final response = await profileRepository.getProfile();

      // Check if response has required data
      if (response != null) {
        profileModel.value = ProfileModel.fromJson(response);
        nameController.text = profileModel.value.data!.fullName ??"";
        update();
      }
    } catch (e) {
      Get.log("Failed to get profile ${e.toString()}");
    } finally {
      CustomLoading.hide();
    }
  }
}
