
import 'package:admin/app/api/api.dart';
import 'package:admin/app/api/api_endpoints.dart';

class ProjectRepo extends ApiClient {
  ProjectRepo() : super();

  Future<dynamic> getProjects({required String parameter}) async {
    try {
      return await apiClientRequest(
        endPoint: kGetProjects,
        body: [],
        parameter: parameter,
        method: "GET",
      );
    } catch (error) {
      Exception(error);
    }
  }
  Future<dynamic> createProject({required  Map<String,dynamic> body}) async {
    try {
      return await apiClientRequest(
        endPoint: kCreateProject,
   
        body: body,
        method: "POST",
      );
    } catch (error) {
      Exception(error);
    }
  }
   Future<dynamic> updateProject({required  Map<String,dynamic> body}) async {
    try {
      return await apiClientRequest(
        endPoint: kUpdateProjects,
   
        body: body,
        method: "PUT",
      );
    } catch (error) {
      Exception(error);
    }
  }
   Future<dynamic> DeleteProject({required  Map<String,dynamic> body}) async {
    try {
      return await apiClientRequest(
        endPoint: kCreateProject,
   
        body: body,
        method: "DELETE",
      );
    } catch (error) {
      Exception(error);
    }
  }
}
