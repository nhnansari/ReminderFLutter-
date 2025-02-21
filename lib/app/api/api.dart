// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'api_preference.dart';
import '../core/widgets/custom_snackbar.dart';
import '../core/widgets/loading.dart';
import '../routes/app_routes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

String prepareUrl(String baseUrl, String endpoint) {
  // Remove trailing slash from base URL if it exists
  if (baseUrl.endsWith('/')) {
    baseUrl = baseUrl.substring(0, baseUrl.length - 1);
  }

  // Remove leading slash from endpoint if it exists
  if (endpoint.startsWith('/')) {
    endpoint = endpoint.substring(1);
  }

  // Combine base URL and endpoint with a single slash
  return '$baseUrl/$endpoint';
}

class ApiClient {
  static String get baseUrl =>
      // => "http://52.66.117.222:2000/api/v1/";
      "https://reminderapi.livinservices.com";

  Future<dynamic> apiClientRequest({
    required String endPoint,
    required dynamic body,
    dynamic parameter,
    required String method,
  }) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        CustomSnackBar.show(message: "No internet connection available.");
        throw Exception("No internet connection available.");
      }

      final uri = parameter != null
          ? Uri.parse('$baseUrl$endPoint$parameter')
          : Uri.parse(baseUrl + endPoint);
      Get.log("$endPoint baseUrl[$method]: $uri ${"body:$body"}");

      final headers = {
        'content-type': 'application/json',
        if (await AppPreferences.getApiToken != null)
          'Authorization': "Bearer ${await AppPreferences.getApiToken}",
      };

      // final url =Uri.parse ('$api_endpoint_url$parameter');

      http.Response response;
      switch (method) {
        case 'POST':
          response =
              await http.post(uri, headers: headers, body: jsonEncode(body));
          break; // ✅ Add break
        case 'PUT':
          response =
              await http.put(uri, headers: headers, body: jsonEncode(body));
          break; // ✅ Add break
        case 'GET':
          response = await http.get(uri, headers: headers);
          break; // ✅ Add break (fix missing break)
        case 'DELETE':
          response =
              await http.delete(uri, headers: headers, body: jsonEncode(body));
          break; // ✅ Add break
        default:
          response = await http.get(uri, headers: headers);
          break; // ✅ Add break
      }

      // Handling the response
      if (response.statusCode == 200) {
        Get.log("$endPoint response[$method]: ${response.body}");
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        final responseBody = jsonDecode(response.body);
        // Unauthorized: Clear session and redirect to login
        await AppPreferences.removeApiToken();
        await AppPreferences.removeProjectId();
        // await AppPreferences.removeProjectRoute();
        // await AppPreferences.removeDeviceToken();
        await AppPreferences.removeCompanyId();
        await AppPreferences.removeSetCompanyData();
        await AppPreferences.removeCustomMsgId();
        await AppPreferences.removeUserName();

        Get.offNamedUntil(AppRoutes.login, (route) => false);
        CustomSnackBar.show(
            message: responseBody["message"] ??
                "Session expired. Please log in again.");
      } else if (response.statusCode == 403) {
        final responseBody = jsonDecode(response.body);
        Get.log("$endPoint response[$method]: ${response.body}");
        // Forbidden: User doesn't have permission
        CustomSnackBar.show(
            message: responseBody["message"] ??
                "Access Denied. Please contact support.");
      } else if (response.statusCode == 404) {
        final responseBody = jsonDecode(response.body);
        Get.log("$endPoint response[$method]: ${response.body}");
        // Not Found: API endpoint incorrect or resource not found
        CustomSnackBar.show(
            message:
                responseBody["message"] ?? "Requested resource not found.");
      } else if (response.statusCode == 500) {
        final responseBody = jsonDecode(response.body);
        Get.log("$endPoint response[$method]: ${response.body}");
        // Internal Server Error: Issue on server-side
        CustomSnackBar.show(
            message: responseBody["message"] ??
                "Server error occurred. Please try again later.");
      } else {
        // Handle unexpected errors with or without JSON response
        Get.log("$endPoint response[$method]: ${response.body}");

        String errorMessage =
            response.reasonPhrase ?? "An unexpected error occurred";

        try {
          final responseBody = jsonDecode(response.body);
          if (responseBody is Map<String, dynamic> &&
              responseBody.containsKey('message')) {
            errorMessage = responseBody['message'];
          }
        } catch (e) {
          Get.log("Failed to parse JSON error response: $e");
        }

        Get.log("Error: $errorMessage");
        CustomSnackBar.show(message: errorMessage);
      }
    } catch (e) {
      // Handle API call exceptions (network issues, timeouts, etc.)
      Get.log("API Client Exception: $e");
      CustomSnackBar.show(
          message: "A network error occurred. Please check your connection.");
      rethrow;
    } finally {
      CustomLoading.hide();
    }
  }

}
