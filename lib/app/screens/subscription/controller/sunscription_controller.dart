import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/widgets/custom_snackbar.dart';
import 'package:admin/app/core/widgets/loading.dart';
import 'package:admin/app/screens/subscription/model/current_subscription_model.dart';
import 'package:admin/app/screens/subscription/model/subscription_model.dart';
import 'package:admin/app/screens/subscription/repository/subscription_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriptionController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getSubscriptionsPackages();
      await getCurrentSubscription();
    });
    super.onInit();
  }

  final msgController = TextEditingController();
  final optionController = TextEditingController();

  // List to store options with their statuses
  RxList<SubscriptionPackagesData> subscriptionsPackages =
      <SubscriptionPackagesData>[].obs;
  SubscriptionPackagesModel subscriptionPackagesModel =
      SubscriptionPackagesModel();
  final currentSubscriptionModel = CurrentSubscriptionModel().obs;
  // RxList<ReminderMessages> customsMsgs = <ReminderMessages>[].obs;

  SubscriptionRepo subscriptionRepo = SubscriptionRepo();

  // Add new option

  void planCheckOut({planId}) async {
    try {
      final Map<String, dynamic> body = {
        "paymentMethodId": "pm_card_visa",
        "planId": planId
      };

      CustomLoading.show();
      final response = await subscriptionRepo.planCheckOut(body: body);

      if (response != null) {
        CustomSnackBar.show(message: response["message"]);

        Uri url = Uri.parse(response["url"]);

        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.inAppBrowserView);
        } else {
          CustomSnackBar.show(
              message: "Could not launch URL", backColor: AppColors.errorColor);
        }

        await getSubscriptionsPackages();
        Get.back();
      }
    } catch (e) {
      Get.log("Error in subscribe: $e");
    } finally {
      CustomLoading.hide();
    }
  }

  Future<void> getSubscriptionsPackages() async {
    try {
      final companyId = await AppPreferences.getCompanyId;
      final parameter = "?companyId=$companyId";
      CustomLoading.show();
      final response =
          await subscriptionRepo.getSubscriptionsPackages(parameter: parameter);

      if (response != null) {
        subscriptionPackagesModel =
            SubscriptionPackagesModel.fromJson(response);
        subscriptionsPackages.value = subscriptionPackagesModel.data!;
        CustomLoading.hide();

        // Agar response successful hai, toh success message show karo
      }
    } catch (e) {
      Get.log("Error in get subscriptions packages $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  Future<void> getCurrentSubscription() async {
    try {
      CustomLoading.show();
      final response = await subscriptionRepo.getCurrentSubscription();

      if (response != null) {
        currentSubscriptionModel.value =
            CurrentSubscriptionModel.fromJson(response);

        CustomLoading.hide();

        // Agar response successful hai, toh success message show karo
      }
    } catch (e) {
      Get.log("Error in get current subscriptions  $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }
}

// Model for each option
