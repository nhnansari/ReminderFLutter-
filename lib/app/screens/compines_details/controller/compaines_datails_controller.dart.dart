import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/core/widgets/taps.dart';
import 'package:admin/app/screens/companies/model/companies_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CompainesDetailsController extends GetxController {
  var companiesModel = Company().obs;

  late PageController pageController;
  late ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    int initialRoute = 0;
    if (GetPlatform.isWeb) {
      initialRoute = AppPreferences.getCompaniesCurrentRoute ?? 0;
    }

    if (initialRoute < 0 || initialRoute >= companyTaps.values.length) {
      initialRoute = 0; // Fallback to a valid value
    }

    pageController = PageController(initialPage: initialRoute);
    currentScreen.value = companyTaps.values[initialRoute];

    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getData();
      // await getProfile();
      // await getCurrentMembership();
      // await getReferralLink();
      // await getCurrentRank();
    });

    if (GetPlatform.isWeb) {
      // Add route listener to update the PageView when the URL changes
      ever(currentScreen, (_) {
        final index = currentScreen.value.index;
        pageController.jumpToPage(index);
      });
    }

    super.onInit();
  }

  getData() async {
    final getArgs = await AppPreferences.getSetCompanyData;

    if (getArgs != null) {
      companiesModel.value = Company.fromJson(getArgs);

      update();
    }
  }

  final Rx<companyTaps> currentScreen = companyTaps.Overview.obs;

  void changeIndex(int index) {
    currentScreen.value = companyTaps.values[index];
    pageController.jumpToPage(index);
    if (GetPlatform.isWeb) {
      AppPreferences.setCompaniesCurrentRoute(index);
    }
  }
}
