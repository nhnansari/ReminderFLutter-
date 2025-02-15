import 'app_routes.dart';
import '../screens/companies/view/compaines_screen.dart';
import '../screens/compines_details/view/compaines_details_screen.dart';
import '../screens/invitation_varification/screens/invitation_varification_screen.dart';
import '../screens/login/view/login_page.dart';
import '../screens/profile/screens/profile_screen.dart';
import '../screens/project_details/view/project_details_screen.dart';
import '../screens/reset_password/view/reset_password_page.dart';
import '../screens/root/guard/root_guard.dart';
import '../screens/sign_up/view/sign_up_page.dart';
import '../screens/team/view/team_screen.dart';

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
        name: AppRoutes.invitationVarification,
        page: () => InvitationVarificationScreen(),
        middlewares: [RouteGuard()]),
         GetPage(
        name: AppRoutes.profile,
        page: () => ProfileScreen(),
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
