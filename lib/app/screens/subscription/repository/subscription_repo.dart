

import 'package:admin/app/api/api.dart';
import 'package:admin/app/api/api_endpoints.dart';

class SubscriptionRepo extends ApiClient {
  SubscriptionRepo() : super();

  Future<dynamic> getSubscriptionsPackages({
    required String parameter,
  }) async {
    try {
      return await apiClientRequest(
        endPoint: kSubscriptionsPackages,
        body: [],
        parameter: parameter,
        method: "GET",
      );
    } catch (error) {
      Exception(error);
    }
  }

//   Future<dynamic> getMsgs({
//     required String parameter,
//   }) async {
//     try {
//       return await apiClientRequest(
//         endPoint: kGetCustomMsgs,
//         body: [],
//         parameter: parameter,
//         method: "GET",
//       );
//     } catch (error) {
//       Exception(error);
//     }
//   }
 Future<dynamic> planCheckOut({
    required Map<String, dynamic> body,
     
  }) async {
    try {
      return await apiClientRequest(
        endPoint: kCheckOut,
        body: body,
      
        method: "POST",
      );
    } catch (error) {
      Exception(error);
    }
  }

  Future<dynamic> getCurrentSubscription() async {
    try {
      return await apiClientRequest(
        endPoint: kCurrentSubscription,
        body: [],
      
        method: "GET",
      );
    } catch (error) {
      Exception(error);
    }
  }
  
}
