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
      // Redirect from auth pages to dashboard
      final checkData = AppPreferences.getSetCompanyData;

      if (route == AppRoutes.login ||
          route == AppRoutes.initial ||
          route == AppRoutes.signUp ||
          route == AppRoutes.resetPassword) {
        if (checkData != null) {
          return RouteSettings(name: AppRoutes.compainesDetails);
        }
        return RouteSettings(name: AppRoutes.main);
      }
      // Allow access to other routes
      return null;
    }

    // If token does not exist
    if (getToken == null) {
      // Redirect non-auth pages to login
      if (route != AppRoutes.login &&
          route != AppRoutes.signUp &&
          route != AppRoutes.resetPassword) {
        return RouteSettings(name: AppRoutes.login);
      }
      // Allow access to auth pages
      return null;
    }

    // Default behavior (should not reach here)
    return null;
  }
}

RouteSettings checkUser() {
  var getToken = AppPreferences.getApiToken;

  if (getToken == null) {
    return RouteSettings(name: AppRoutes.login);
  } else {
    return RouteSettings(name: AppRoutes.main);
  }
}
