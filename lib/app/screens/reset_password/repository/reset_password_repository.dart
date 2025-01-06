
import 'package:admin/app/api/api.dart';
import 'package:admin/app/api/api_endpoints.dart';

class ResetPasswordRepository extends ApiClient {
  ResetPasswordRepository() : super();
  Future<dynamic> forgetPass({
    required Map<String, dynamic> body,
    String ? endpoint,
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

  Future<dynamic> resetPassword({
    required Map<String, dynamic> body,
  }) async {
    try {
      return await apiClientRequest(
        endPoint: kResetPassword,
        body: body,
        method: "POST",
      );
    } catch (error) {
      Exception(error);
    }
  }

  Future<dynamic> varifyOtp({
    required Map<String, dynamic> body,
  }) async {
    try {
      return await apiClientRequest(
        endPoint: kVarifyOtp,
        body: body,
        method: "POST",
      );
    } catch (error) {
      Exception(error);
    }
  }
}
