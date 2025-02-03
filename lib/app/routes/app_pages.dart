import 'package:admin/app/routes/app_routes.dart';
import 'package:admin/app/screens/companies/view/compaines_screen.dart';
import 'package:admin/app/screens/compines_details/view/compaines_details_screen.dart';
import 'package:admin/app/screens/login/view/login_page.dart';
import 'package:admin/app/screens/project_details/view/project_details_screen.dart';
import 'package:admin/app/screens/reset_password/view/reset_password_page.dart';
import 'package:admin/app/screens/root/guard/root_guard.dart';
import 'package:admin/app/screens/sign_up/view/sign_up_page.dart';
import 'package:admin/app/screens/team/view/team_screen.dart';

import 'package:get/get.dart';

class AppPages extends AppRoutes {
  static final pages = [
    GetPage(
        name: AppRoutes.initial,
        page: () => LoginPage(),
        middlewares: [RouteGuard()]),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginPage(),
        middlewares: [RouteGuard()]),
    GetPage(
        name: AppRoutes.projectDetailScreen,
        page: () => ProjectDetailsScreen(),
        middlewares: [RouteGuard()]),
    GetPage(
        name: AppRoutes.signUp,
        page: () => SighnupPage(),
        middlewares: [RouteGuard()]),
    GetPage(
        name: AppRoutes.resetPassword,
        page: () => ResetPasswordPage(),
        middlewares: [RouteGuard()]),
    GetPage(
        name: AppRoutes.companies,
        page: () => CompainesScreen(),
        middlewares: [RouteGuard()]),
    GetPage(
        name: AppRoutes.compainesDetails,
        page: () => CompainesDetailsScreen(),
        middlewares: [
          RouteGuard()
        ],
        children: [
          GetPage(
              name: AppRoutes.team,
              page: () => TeamScreen(),
              middlewares: [RouteGuard()]),
        ]),
  ];
}
