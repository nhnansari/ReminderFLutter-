// import 'package:admin/app/api/api_preference.dart';
import '../../../api/api_preference.dart';
import '../../../core/widgets/taps.dart';
import '../../project/model/project_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProjectDetailsController extends GetxController {
  late PageController pageController;
  var projectModel = ProjectListData().obs;
  // late ScrollController scrollController;

  @override
  void onInit() {
    int initialRoute = 0;
    if (GetPlatform.isWeb) {
      // initialRoute = 0;
      initialRoute =   0;
    }

    if (initialRoute < 0 || initialRoute >= projectDetailsTaps.values.length) {
      initialRoute = 0; // Fallback to a valid value
    }

    pageController = PageController(initialPage: initialRoute);
    currentScreen.value = projectDetailsTaps.values[initialRoute];

    // scrollController = ScrollController();
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
    final getArgs = await AppPreferences.getProjectDetail;

    if (getArgs != null) {
      projectModel.value = ProjectListData.fromJson(getArgs);
      // AppPreferences.setCompanyId(projectModel.value.id.toString());

      update();
    }
  }
  final Rx<projectDetailsTaps> currentScreen = projectDetailsTaps.Task.obs;

  void changeIndex(int index) {
    currentScreen.value = projectDetailsTaps.values[index];
    pageController.jumpToPage(index);
    if (GetPlatform.isWeb) {
      // AppPreferences.setProjectRoute(index);
    }
  }
}
