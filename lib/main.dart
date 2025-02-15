import 'app/core/utils/app_constant.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/services/initial_setting_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await GetStorage.init();

  Get.log("Starting Services ......");

  await Get.putAsync(() => InitialSettingServices().init());

  Get.log("Started Services");
}

void main() async {
  await _init();

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: SimpleBuilder(
        builder: (context) => GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: GetMaterialApp(
            title: kAppName,
            themeMode: Get.find<InitialSettingServices>().getthememode(),
            theme: Get.find<InitialSettingServices>().getLightTheme(),
            getPages: AppPages.pages,
            initialRoute: AppRoutes.initial,
            defaultTransition: Transition.fadeIn,
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
