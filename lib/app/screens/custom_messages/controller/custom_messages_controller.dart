import '../../../api/api_preference.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../core/widgets/loading.dart';
import '../model/custom_mesg_model.dart';
import '../model/option_model.dart';
import '../repository/custom_msg_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMessagesController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getCustomMsg();
    });
    super.onInit();
  }

  final msgController = TextEditingController();
  final optionController = TextEditingController();

  // List to store options with their statuses
  RxList<OptionModel> options = <OptionModel>[].obs;
  CustomMessageModel customMessageModel = CustomMessageModel();
  RxList<ReminderMessages> customsMsgs = <ReminderMessages>[].obs;

  var isAddOptions = false.obs;
  var selectStatus = "Select a Status".obs;
  CustomMsgRepo customMsgRepo = CustomMsgRepo();

  // Add new option
  void addOption() {
    options.add(OptionModel(
      option: TextEditingController(),
      nature: selectStatus.value,
      movesTask: false,
      // taskStageId: 2,
    ));
  }

  // Remove option
  void removeOption(int index) {
    options.removeAt(index);
  }

  // Validate all options
  bool validateOptions() {
    for (var option in options) {
      if (option.option.text.isEmpty || option.nature == "selectStatus") {
        return false;
      }
    }
    return true;
  }

  void createMsg() async {
    try {
      final companyID = await AppPreferences.getCompanyId;
      final optionsList = options.map((option) {
        return {
          "option": option.option.text.trim(),
          "nature": option.nature,
          "movesTask": option.movesTask,
          // "taskStageId": option.taskStageId,
        };
      }).toList();

      final Map<String, dynamic> body = {
        "companyId": companyID,
        "message": msgController.text.trim(),
        "options": optionsList,
      };

      CustomLoading.show();
      final response = await customMsgRepo.createMsg(
        body: body,
      );

      if (response != null) {
        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: response["message"]);
        await getCustomMsg();
        Get.back();

        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in create msg id  $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  void updateMsg(msgId) async {
    try {
      final companyID = await AppPreferences.getCompanyId;

      final parameter = "/$msgId";

      final optionsList = options.map((option) {
        return {
          "option": option.option.text.trim(),
          "nature": option.nature,
          "movesTask": option.movesTask,
          // "taskStageId": option.taskStageId,
        };
      }).toList();

      final Map<String, dynamic> body = {
        "companyId": companyID,
        "message": msgController.text.trim(),
        "options": optionsList,
      };

      CustomLoading.show();
      final response = await customMsgRepo.updateMsg(
        parameter: parameter,
        body: body,
      );

      if (response != null) {
        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: response["message"]);
        await getCustomMsg();
        Get.back();

        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in update custom msg $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }

  void deleteMsg(msgId) async {
    try {
      final companyID = await AppPreferences.getCompanyId;

      final parameter = "/$msgId";

      final Map<String, dynamic> body = {"companyId": companyID};

      CustomLoading.show();
      final response = await customMsgRepo.deleteMsg(
        body: body,
        parameter: parameter,
      );

      if (response != null) {
        // Agar response successful hai, toh success message show karo
        CustomSnackBar.show(message: response["message"]);
        await getCustomMsg();
        Get.back();

        CustomLoading.hide();
      }
    } catch (e) {
      Get.log("Error in delete custom msg $e");
    } finally {
      CustomLoading.hide();
    } // clear();
  }

  Future<void> getCustomMsg() async {
    try {
      final companyId = await AppPreferences.getCompanyId;
      final parameter = "?companyId=$companyId";
      CustomLoading.show();
      final response = await customMsgRepo.getMsgs(parameter: parameter);

      if (response != null) {
        customMessageModel = CustomMessageModel.fromJson(response);
        customsMsgs.value = customMessageModel.reminderMessages!;
        CustomLoading.hide();

        // Agar response successful hai, toh success message show karo
      }
    } catch (e) {
      Get.log("Error in get custom Msgs $e");
    } finally {
      CustomLoading.hide();
      // clear();
    }
  }
}

// Model for each option
