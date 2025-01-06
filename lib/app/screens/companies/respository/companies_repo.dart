
import 'package:admin/app/api/api.dart';
import 'package:admin/app/api/api_endpoints.dart';

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
}
