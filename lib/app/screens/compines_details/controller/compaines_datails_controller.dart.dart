import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/core/widgets/taps.dart';
import 'package:admin/app/screens/companies/model/companies_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CompainesDetailsController extends GetxController {
  var companiesModel = Company().obs;

  late PageController pageController;
  late ScrollController scrollController;

  @override
  void onInit() {
    int initialRoute = AppPreferences.getCompaniesCurrentRoute ?? 0;

    if (initialRoute < 0 || initialRoute >= companyTaps.values.length) {
      initialRoute = 0;
    }

    pageController = PageController(initialPage: initialRoute);
    scrollController = ScrollController();

    currentScreen.value = companyTaps.values[initialRoute];

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getData();
    });

    ever(currentScreen, (_) {
      if (pageController.hasClients) {
        pageController.jumpToPage(currentScreen.value.index);
      }
    });

    super.onInit();
  }

  final Rx<companyTaps> currentScreen = companyTaps.Projects.obs;

  void changeIndex(int index) {
    currentScreen.value = companyTaps.values[index];
    // if (pageController.hasClients) {
    //   pageController.jumpToPage(index); // Ensure this is properly executed
    // }
    AppPreferences.setCompaniesCurrentRoute(index);
  }

  getData() async {
    final getArgs = await AppPreferences.getSetCompanyData;

    if (getArgs != null) {
      companiesModel.value = Company.fromJson(getArgs);
      AppPreferences.setCompanyId(companiesModel.value.id.toString());
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
