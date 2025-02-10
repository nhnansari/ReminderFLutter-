import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/core/widgets/custom_snackbar.dart';
import 'package:admin/app/core/widgets/loading.dart';
import 'package:admin/app/screens/company_users/controller/company_user_controller.dart';
import 'package:admin/app/screens/custom_messages/controller/custom_messages_controller.dart';
import 'package:admin/app/screens/reminders/model/reminder_model.dart';
import 'package:admin/app/screens/reminders/respository/reminder_repo.dart';
import 'package:admin/app/screens/team/controller/team_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReminderController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getMyReminders();
      isWorker.value = await AppPreferences.getserRole;
    });
    super.onInit();
  }

  final replyController = TextEditingController();
  ReminderRepo reminderRepo = ReminderRepo();
  final isWorker = "".obs;

  final teamController = Get.put(TeamController());
  final companyWorkerController = Get.put(CompanyUserController());
  final msgController = Get.put(CustomMessagesController());
  var selectedUserId = "".obs;
  var selectedMsgId = "".obs;
  var selectedTeamId = "".obs;
  final optionIndex = (-1).obs;

  void changeIndex(index) {
    optionIndex.value = index;
  }

  ReminderModel reminderModel = ReminderModel();
  final reminders = <ReminderData>[].obs;

  Future<void> getMyReminders() async {
    try {
      final companyId = await AppPreferences.getCompanyId;
      final parameter = "?companyId=$companyId";
      CustomLoading.show();
      final response = await reminderRepo.getReminders(parameter: parameter);

      if (response != null) {
        reminderModel = ReminderModel.fromJson(response);
        reminders.clear();
        reminders.value = reminderModel.data!;
        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in get reminder $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  void sendReminder() async {
    CustomLoading.show();
    final companyId = await AppPreferences.getCompanyId;

    try {
      final Map<String, dynamic> body = {
        "companyId": companyId,
        "userId": int.parse(selectedUserId.value),
        "teamId": int.parse(selectedTeamId.value),
        "reminderMessageId": int.parse(selectedMsgId.value),
      };

      final response = await reminderRepo.sendReminder(
        body: body,
      );

      if (response != null) {
        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: "Reminder send Successfully");
        Get.back();
        await getMyReminders();

        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in send reminder $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  void replyReminder({optionId, reminderId}) async {
    CustomLoading.show();
    final companyId = await AppPreferences.getCompanyId;

    try {
      final Map<String, dynamic> body = {
        "reminderId": reminderId,
        "optionId": optionId,
        "message": replyController.text.trim(),
        "companyId": companyId
      };

      final response = await reminderRepo.replyReminder(
        body: body,
      );

      if (response != null) {
        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: "Send Successfully");
        Get.back();
        await getMyReminders();

        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in reply reminder $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  void deleteReminder(reminderId) async {
    try {
      final companyID = await AppPreferences.getCompanyId;

      final parameter = "/$reminderId";
      final body = {
        "companyId": companyID,
      };

      CustomLoading.show();
      final response = await reminderRepo.deleteReminders(
        body: body,
        parameter: parameter,
      );

      if (response != null) {
        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: response["message"]);
        await getMyReminders();

        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in delete reminder $e");
    } finally {
      CustomLoading.hide();
    } // clear();
  }
}
