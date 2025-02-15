import '../../../api/api_preference.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../core/widgets/loading.dart';
import '../../company_users/controller/company_user_controller.dart';
import '../../custom_messages/controller/custom_messages_controller.dart';
import '../model/reminder_model.dart';
import '../model/reminder_reply_model.dart';
import '../respository/reminder_repo.dart';
import '../../team/controller/team_controller.dart';
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
  final headertext = 0.obs;
  void chnageHeaderIndex(index) async {
    headertext.value = index;
    if (index == 0) {
      await getMyReminders();
    } else {
      await getCompanyReminders();
    }
  }

  void changeIndex(index) {
    optionIndex.value = index;
  }

  ReminderModel reminderModel = ReminderModel();
  final reminders = <ReminderData>[].obs;

  ReminderReplyModel reminderReplyModel = ReminderReplyModel();
  final reminderReply = <Data>[].obs;

  final currentPage = 1.obs;

  //used for Pagination
  final totalPages = 0.obs;

  void nextPage() async {
    if (currentPage < totalPages.value) {
      currentPage.value++;

      await getCompanyReminders();
    }
  }

  void priviousPage() async {
    if (currentPage > 0) {
      currentPage.value--;

      await getCompanyReminders();
    }
  }

  void gotoPage(int index) async {
    currentPage.value = index;

    await getCompanyReminders();
  }

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

  Future<void> getCompanyReminders() async {
    try {
      final companyId = await AppPreferences.getCompanyId;
      final parameter = "?companyId=$companyId&page=${currentPage.value}";
      CustomLoading.show();
      final response =
          await reminderRepo.getReminderReply(parameter: parameter);

      if (response != null) {
        reminderReplyModel = ReminderReplyModel.fromJson(response);
        reminderReply.clear();
        reminderReply.value = reminderReplyModel.data!.data!;
        currentPage.value = reminderReplyModel.data!.meta!.currentPage!;
        totalPages.value =(reminderReplyModel.data!.meta!.total! / reminderReplyModel.data!.meta!.perPage!).ceil()
        
         ;
        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in get company reminders $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  void sendReminder() async {
    CustomLoading.show();
    final companyId = await AppPreferences.getCompanyId;

    try {
      if (selectedMsgId.value.isEmpty) {
        CustomSnackBar.show(message: "Please select message");
        return;
      }
      final Map<String, dynamic> body = {
        "companyId": companyId,
        "userId": selectedUserId.value.isEmpty
            ? null
            : int.parse(selectedUserId.value),
        "teamId": selectedTeamId.value.isEmpty
            ? null
            : int.parse(selectedTeamId.value),
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
