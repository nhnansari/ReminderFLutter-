// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'package:admin/app/api/api_preference.dart';
import 'package:admin/app/core/widgets/custom_snackbar.dart';
import 'package:admin/app/core/widgets/loading.dart';
import 'package:flutter/foundation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

String preprocessJson(String source) {
  // Regex to match numbers larger than 9007199254740991
  final regex = RegExp(r'(?<!")\b\d{16,}\b(?!")');
  return source.replaceAllMapped(regex, (match) => '"${match.group(0)}"');
}

dynamic jsonDecodeWithBigInt(String source) {
  final preprocessed = preprocessJson(source);
  return jsonDecode(preprocessed, reviver: (key, value) {
    if ((key == 'id' || key == 'external_tx_id') && value is String) {
      return BigInt.parse(value);
    }
    return value;
  });
}

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
          break;
        case 'PUT':
          response =
              await http.put(uri, headers: headers, body: jsonEncode(body));
          break;
        case 'GET':
          response = await http.get(uri, headers: headers);
        case 'DELETE':
          response =
              await http.delete(uri, headers: headers, body: jsonEncode(body));
        default:
          response = await http.get(uri, headers: headers);
      }

      // Handling the response
      if (response.statusCode == 200) {
        Get.log("$endPoint response[$method]: ${response.body}");

        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        await AppPreferences.removeApiToken();
        await AppPreferences.removeProjectId();
        await AppPreferences.removeProjectRoute();
        await AppPreferences.removeDeviceToken();
        await AppPreferences.removeCompanyId();
        // Get.put(LogoutController()).deleteReferralCookie();
        // Get.offAllNamed(AppRoutes.login);
      } else {
        var errorMessage = response.reasonPhrase ?? "Unexpected Error Occur";
        final responseBody = jsonDecode(response.body) ?? response.reasonPhrase;
        errorMessage = responseBody['message'] ?? errorMessage;

        Get.log("Error: $errorMessage");
        CustomSnackBar.show(message: errorMessage);
        // throw Exception(errorMessage);
      }
    } catch (e) {
      // Exception handling
      Get.log("Api Client exception occur : $e");
      CustomLoading.hide();

      CustomSnackBar.show(message: e.toString());

      rethrow;
    } finally {
      CustomLoading.hide();
    }
  }

  // Future<dynamic> apiClientRequestWithFile({
  //   required String endPoint,
  //   Map<String, dynamic>? body,
  //   Function(int, int)? onSendProgress,
  //   Uint8List? webImageBytes, // For web, in-memory image data
  //   String? webFileName, // File name for web
  //   File? file,
  // }) async {
  //   try {
  //     Get.log("$endPoint baseUrl[POST{form_data}]: ${baseUrl + endPoint}");

  //     final uri = Uri.parse(baseUrl + endPoint);
  //     final request = http.MultipartRequest('PUT', uri);

  //     // Adding headers
  //     if (AppPreferences.getApiToken != null) {
  //       final auth = AppPreferences.getApiToken.toString();
  //       request.headers['Authorization'] = "Bearer $auth";
  //       request.headers['X-Api-Key'] = 'teri';
  //       request.headers['X-Api-Secret'] = 'meri';
  //     }

  //     // Adding body fields
  //     if (body != null) {
  //       request.fields
  //           .addAll(body.map((key, value) => MapEntry(key, value.toString())));
  //     }

  //     // Determine MIME type based on file extension
  //     String? mimeType;
  //     String? fileName;

  //     if (GetPlatform.isWeb && webImageBytes != null && webFileName != null) {
  //       fileName = webFileName;
  //     } else if (file != null) {
  //       fileName = file.path.split('/').last;
  //     }

  //     if (fileName != null) {
  //       if (fileName.endsWith('.jpg') || fileName.endsWith('.jpeg')) {
  //         mimeType = 'image/jpeg';
  //       } else if (fileName.endsWith('.png')) {
  //         mimeType = 'image/png';
  //       } else if (fileName.endsWith('.webp')) {
  //         mimeType = 'image/webp';
  //       } else {
  //         throw Exception(
  //             "Invalid file format. Only JPG, JPEG, PNG, and WEBP are allowed.");
  //       }
  //     }

  //     if (GetPlatform.isWeb && webImageBytes != null && webFileName != null) {
  //       // For web: Use fromBytes with in-memory image data and specify the content type
  //       request.files.add(http.MultipartFile.fromBytes(
  //         'profile_picture',
  //         webImageBytes,
  //         filename: webFileName,
  //         contentType: MediaType.parse(mimeType!),
  //       ));
  //     } else if (!GetPlatform.isWeb && file != null) {
  //       // For mobile/desktop: Use file path and specify the content type
  //       String formattedPath = file.path.replaceAll(r'\', '/');
  //       request.files.add(await http.MultipartFile.fromPath(
  //         'profile_picture',
  //         formattedPath,
  //         contentType: MediaType.parse(mimeType!),
  //       ));
  //     } else {
  //       throw Exception('No image selected');
  //     }

  //     // Sending the request and handling the response
  //     final streamedResponse = await request.send();
  //     final response = await http.Response.fromStream(streamedResponse);

  //     if (response.statusCode == 200) {
  //       Get.log("$endPoint response[POST{form_data}]: ${response.body}");
  //       return jsonDecode(response.body);
  //     } else {
  //       // Handling errors if status code is not 200
  //       var errorMessage = response.reasonPhrase ?? "Unexpected Error Occurred";
  //       final responseBody = jsonDecode(response.body);
  //       errorMessage = responseBody['message'] ?? errorMessage;

  //       Get.log("Error: $errorMessage");
  //       CustomSnackBar.show(message: errorMessage);
  //       return Future.error("Error: $errorMessage");
  //     }
  //   } catch (e) {
  //     // Exception handling
  //     Get.log("Api Client exception in file occurred: $e");
  //     CustomLoading.hide();
  //     CustomSnackBar.show(message: e.toString());
  //     rethrow;
  //   } finally {
  //     CustomLoading.hide();
  //   }
  // }

// For kIsWeb

  Future<dynamic> uploadImageToS3({
    required dynamic imageSource, // File for mobile/desktop, Uint8List for web
    required String presignedUrl,
  }) async {
    try {
      // Initialize variables
      Uint8List fileBytes;
      String contentType = '';
      String? fileName;

      // Determine platform and validate file
      if (GetPlatform.isWeb) {
        // Web: Validate and process Uint8List
        if (imageSource is Uint8List && imageSource.isNotEmpty) {
          fileBytes = imageSource;
          fileName = "web_uploaded_image.jpg"; // Default name for web uploads

          // Validate format (if fileName is known or UI provides hints)
          if (fileName.endsWith('.jpg') || fileName.endsWith('.jpeg')) {
            contentType = 'image/jpeg';
          } else if (fileName.endsWith('.png')) {
            contentType = 'image/png';
          } else if (fileName.endsWith('.webp')) {
            contentType = 'image/webp';
          } else {
            throw Exception(
                "Invalid file format. Only JPG, JPEG, PNG, and WEBP are allowed for web.");
          }
        } else {
          throw Exception("Invalid or empty image source for web.");
        }
      } else {
        // Mobile/Desktop: Validate and process File
        if (imageSource is File && await imageSource.exists()) {
          fileBytes = await imageSource.readAsBytes();
          fileName = imageSource.path.split('/').last;

          // Validate file extension
          if (fileName.endsWith('.jpg') || fileName.endsWith('.jpeg')) {
            contentType = 'image/jpeg';
          } else if (fileName.endsWith('.png')) {
            contentType = 'image/png';
          } else if (fileName.endsWith('.webp')) {
            contentType = 'image/webp';
          } else {
            throw Exception(
                "Invalid file format. Only JPG, JPEG, PNG, and WEBP are allowed for mobile/desktop.");
          }
        } else {
          throw Exception("Invalid image source or file does not exist.");
        }
      }

      // Send PUT request to S3 presigned URL
      final response = await http.put(
        Uri.parse(presignedUrl),
        body: fileBytes,
        headers: {'Content-Type': contentType},
      );

      // Check response status
      if (response.statusCode == 200) {
        Get.log("$presignedUrl response[PUT]: ${response.body}");
        return response.body;
      } else {
        // Handling errors if status code is not 200
        var errorMessage = response.reasonPhrase ?? "Unexpected Error Occurred";
        final responseBody = jsonDecode(response.body);
        errorMessage = responseBody['message'] ?? errorMessage;

        Get.log("Error: $errorMessage");
        CustomSnackBar.show(message: errorMessage);
        return Future.error("Error: $errorMessage");
      }
    } catch (e) {
      // Exception handling
      Get.log("Api Client exception in file occurred: $e");
      CustomLoading.hide();
      CustomSnackBar.show(message: e.toString());
      rethrow;
    } finally {
      CustomLoading.hide();
    }
  }
}
