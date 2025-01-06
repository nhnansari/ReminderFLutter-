import 'package:admin/app/services/initial_setting_services.dart';
import 'package:get/get.dart';

String kAppName = Get.find<InitialSettingServices>().settingmodel.appName!;
const String kInitialSettingJson =
    "assets/initial_setting/initial_setting.json";
