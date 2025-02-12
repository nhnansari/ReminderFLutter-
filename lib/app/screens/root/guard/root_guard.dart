import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RouteGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    var getToken = AppPreferences.getApiToken;

    // If token exists
    if (getToken != null) {
      final checkData = AppPreferences.getSetCompanyData;

      if (route == AppRoutes.login ||
          route == AppRoutes.initial ||
          route == AppRoutes.signUp ||
          route == AppRoutes.resetPassword) {
        if (checkData != null) {
          return RouteSettings(name: AppRoutes.compainesDetails);
        }
        return RouteSettings(name: AppRoutes.companies);
      }
      return null; // Allow access to other routes
    }

    // If token does not exist
    if (getToken == null) {
      // **Allow /invitationVerification route**
      if (route == AppRoutes.invitationVarification) {
        return null; // Allow access
      }

      // Redirect non-auth pages to login
      if (route != AppRoutes.login &&
          route != AppRoutes.signUp &&
          route != AppRoutes.resetPassword) {
        return RouteSettings(name: AppRoutes.login);
      }
    }

    return null;
  }
}

RouteSettings checkUser() {
  var getToken = AppPreferences.getApiToken;

  if (getToken == null) {
    return RouteSettings(name: AppRoutes.login);
  } else {
    return RouteSettings(name: AppRoutes.companies);
  }
}
