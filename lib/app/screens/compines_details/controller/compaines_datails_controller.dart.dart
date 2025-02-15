import '../../../api/api_preference.dart';
import '../../../core/widgets/taps.dart';
import '../../companies/model/companies_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompaniesDetailsController extends GetxController {
  var companiesModel = Company().obs;
  var isWorker = "".obs;
  var currentScreen = Rx<dynamic>(companyWorkerTaps.Dashboard); 

  late final PageController pageController = PageController(initialPage: 0);
  late final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();

    // Delay asynchronous initialization until after the first frame is rendered.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getData();
      isWorker.value = await AppPreferences.getserRole;

      int initialRoute = AppPreferences.getCompaniesCurrentRoute ?? 0;
      final tapsList = isWorker.value == "admin"
          ? companyAdminTaps.values
          : companyWorkerTaps.values;

      if (initialRoute < 0 || initialRoute >= tapsList.length) {
        initialRoute = 0;
      }

      // Update the current screen based on the retrieved initial route.
      currentScreen.value = tapsList[initialRoute];

      // Jump to the appropriate page using the already initialized controller.
      if (pageController.hasClients) {
        pageController.jumpToPage(initialRoute);
      }

      // Listen for changes in currentScreen and update the page accordingly.
      ever(currentScreen, (_) {
        if (pageController.hasClients) {
          pageController.jumpToPage(currentScreen.value.index);
        }
      });
    });
  }
  void changeIndex(int index) {
    final tapsList = isWorker.value == "admin" ? companyAdminTaps.values : companyWorkerTaps.values;
    if (index >= 0 && index < tapsList.length) {
      currentScreen.value = tapsList[index];
      AppPreferences.setCompaniesCurrentRoute(index);
    }
  }

  Future<void> getData() async {
    final getArgs = await AppPreferences.getSetCompanyData;
    if (getArgs != null) {
      companiesModel.value = Company.fromJson(getArgs);
     
      Get.log(companiesModel.value.id.toString());
      update();
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
