import 'package:admin/app/api/api.dart';
import 'package:admin/app/api/api_endpoints.dart';

class CompanyUserRepo extends ApiClient {
  CompanyUserRepo() : super();

  Future<dynamic> getCompanyUser({required String parameter}) async {
    try {
      return await apiClientRequest(
        endPoint: kCompanyWorkers,
        parameter: parameter,
        body: [],
        method: "GET",
      );
    } catch (error) {
      Exception(error);
    }
  }

  Future<dynamic> addCompanyUser({required Map<String, dynamic> body}) async {
    try {
      return await apiClientRequest(
        endPoint: kAddCompanyUser,
        body: body,
        method: "POST",
      );
    } catch (error) {
      Exception(error);
    }
  }

  Future<dynamic> deleteCompanyUser(
      {required Map<String, dynamic> body}) async {
    try {
      return await apiClientRequest(
        endPoint: kDeleteCompanyUser,
        body: body,
        method: "DELETE",
      );
    } catch (error) {
      Exception(error);
    }
  }
}
