

import 'package:admin/app/api/api.dart';
import 'package:admin/app/api/api_endpoints.dart';

class CustomMsgRepo extends ApiClient {
  CustomMsgRepo() : super();

  Future<dynamic> createMsg({
    required Map<String, dynamic> body,
  }) async {
    try {
      return await apiClientRequest(
        endPoint: kCreateCustomMessage,
        body: body,
        method: "POST",
      );
    } catch (error) {
      Exception(error);
    }
  }

  Future<dynamic> getMsgs({
    required String parameter,
  }) async {
    try {
      return await apiClientRequest(
        endPoint: kGetCustomMsgs,
        body: [],
        parameter: parameter,
        method: "GET",
      );
    } catch (error) {
      Exception(error);
    }
  }
 Future<dynamic> updateMsg({
    required Map<String, dynamic> body,
     required String parameter,
  }) async {
    try {
      return await apiClientRequest(
        endPoint: kUpdateCustomMsg,
        body: body,
        parameter: parameter,
        method: "POST",
      );
    } catch (error) {
      Exception(error);
    }
  }

  Future<dynamic> deleteMsg({
    required Map<String, dynamic> body,
     required String parameter,
  }) async {
    try {
      return await apiClientRequest(
        endPoint: kDeleteCustomMsg,
        body: body,
        parameter: parameter,
        method: "DELETE",
      );
    } catch (error) {
      Exception(error);
    }
  }
  
}
