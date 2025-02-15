

import '../../../api/api.dart';
import '../../../api/api_endpoints.dart';

class ProfileRepository extends ApiClient {
  ProfileRepository() : super();

  Future<dynamic> updateProfile({
    required Map<String, dynamic> body,
  }) async {
    try {
      return await apiClientRequest(
        endPoint: kUpdateProfile,
        body: body,
        method: "POST",
      );
    } catch (error) {
      Exception(error);
    }
  }

Future<dynamic> getProfile() async {
    try {
      return await apiClientRequest(
        endPoint: KProfile,
        body: [],
        method: "GET",
      );
    } catch (error) {
      Exception(error);
    }
  }

 
  
}
