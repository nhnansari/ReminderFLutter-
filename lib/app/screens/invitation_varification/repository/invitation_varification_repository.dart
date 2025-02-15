

import '../../../api/api.dart';
import '../../../api/api_endpoints.dart';

class InvitationVarificationRepository extends ApiClient {
  InvitationVarificationRepository() : super();

  Future<dynamic> acceptInvitation({
    required Map<String, dynamic> body,
  }) async {
    try {
      return await apiClientRequest(
        endPoint: kInvitation,
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
