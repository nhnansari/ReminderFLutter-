
import 'package:admin/app/api/api.dart';
import 'package:admin/app/api/api_endpoints.dart';

class SignUpRepository extends ApiClient {
  SignUpRepository() : super();

  Future<dynamic> SignUpUser({
    required Map<String, dynamic> body,
  }) async {
    try {
      return await apiClientRequest(
        endPoint: kSignUp,
        body: body,
        method: "POST",
      );
    } catch (error) {
      Exception(error);
    }
  }
  // Future<dynamic> getDataByAccId({required  String parameter}) async {
  //   try {
  //     return await apiClientRequest(
  //       endPoint: kCheckUserByAccId,
  //       parameter:parameter ,
  //       body: [],
  //       method: "GET",
  //     );
  //   } catch (error) {
  //     Exception(error);
  //   }
  // }
}
