
import '../../../api/api.dart';
import '../../../api/api_endpoints.dart';

class CompaniesRepo extends ApiClient {
  CompaniesRepo() : super();

  Future<dynamic> getCompanies() async {
    try {
      return await apiClientRequest(
        endPoint: kCompanies,
        body: [],
        method: "GET",
      );
    } catch (error) {
      Exception(error);
    }
  }
  Future<dynamic> registerCompany({required  Map<String,dynamic> body}) async {
    try {
      return await apiClientRequest(
        endPoint: kRegisterCompanies,
   
        body: body,
        method: "POST",
      );
    } catch (error) {
      Exception(error);
    }
  }

    Future<dynamic> getMyRole({parameter}) async {
    try {
      return await apiClientRequest(
        endPoint: kMyRole,
        body: [],
        parameter: parameter,
        method: "GET",
      );
    } catch (error) {
      Exception(error);
    }
  }
}
