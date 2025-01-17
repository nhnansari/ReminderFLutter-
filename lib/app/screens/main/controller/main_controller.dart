// import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/core/widgets/taps.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  late PageController pageController;
  // late ScrollController scrollController;

  @override
  void onInit() {
    int initialRoute = 0;
    if (GetPlatform.isWeb) {
      // initialRoute = 0;
      initialRoute = AppPreferences.getCurrentRoute ?? 0;
    }

    if (initialRoute < 0 || initialRoute >= dashboardTaps.values.length) {
      initialRoute = 0; // Fallback to a valid value
    }

    pageController = PageController(initialPage: initialRoute);
    currentScreen.value = dashboardTaps.values[initialRoute];

    // scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
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

  final Rx<dashboardTaps> currentScreen = dashboardTaps.Dashboard.obs;

  void changeIndex(int index) {
    currentScreen.value = dashboardTaps.values[index];
    pageController.jumpToPage(index);
    if (GetPlatform.isWeb) {
      AppPreferences.setCurrentRoute(index);
    }
  }
}
