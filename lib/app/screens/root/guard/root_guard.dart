import '../../../api/api_preference.dart';
import '../../../routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RouteGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    var getToken = AppPreferences.getApiToken;
    Uri uri = Uri.parse(route ?? ""); // Extract path only
    print("Redirect triggered for route: ${uri.path}");
    print("Current Token: $getToken");

    if (getToken != null) {
      final checkData = AppPreferences.getSetCompanyData;
      if (uri.path == AppRoutes.login ||
          uri.path == AppRoutes.initial ||
          uri.path == AppRoutes.signUp ||
          uri.path == AppRoutes.resetPassword) {
        if (checkData != null) {
          return RouteSettings(name: AppRoutes.compainesDetails);
        }
        return RouteSettings(name: AppRoutes.companies);
      }
      return null; // Allow access
    }

    if (getToken == null) {
      if (uri.path == AppRoutes.invitationVarification) {
        print("Allowing invitation verification route");
        return null; // ✅ Allow this route
      }
      if (uri.path != AppRoutes.login &&
          uri.path != AppRoutes.signUp &&
          uri.path != AppRoutes.resetPassword) {
        print("Redirecting to Login");
        return RouteSettings(name: AppRoutes.login);
      }
    }

    return null;
  }
}

// RouteSettings checkUser() {
//   var getToken = AppPreferences.getApiToken;

//   if (getToken == null) {
//     return RouteSettings(name: AppRoutes.login);
//   } else {
//     return RouteSettings(name: AppRoutes.companies);
//   }
// }
