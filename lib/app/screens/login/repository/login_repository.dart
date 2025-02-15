

import '../../../api/api.dart';
import '../../../api/api_endpoints.dart';

class LoginRepository extends ApiClient {
  LoginRepository() : super();

  Future<dynamic> LoginUser({
    required Map<String, dynamic> body,
  }) async {
    try {
      return await apiClientRequest(
        endPoint: kLogin,
        body: body,
        method: "POST",
      );
    } catch (error) {
      Exception(error);
    }
  }

  Future<dynamic> ForgetPass({
    required Map<String, dynamic> body,
  }) async {
    try {
      return await apiClientRequest(
        endPoint: kForgetPassword,
        body: body,
        method: "POST",
      );
    } catch (error) {
      Exception(error);
    }
  }

  
}
