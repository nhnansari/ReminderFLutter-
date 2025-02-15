
import '../../../api/api.dart';
import '../../../api/api_endpoints.dart';

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
   Future<dynamic> updateProject({required  Map<String,dynamic> body , paramter}) async {
    try {
      return await apiClientRequest(
        endPoint: kUpdateProjects,
   
        body: body,
        parameter: paramter,
        method: "PUT",
      );
    } catch (error) {
      Exception(error);
    }
  }
   Future<dynamic> deleteProject({ parameter}) async {
    try {
      return await apiClientRequest(
        endPoint: kCreateProject,
   
        body: [],
        parameter: parameter,
        method: "DELETE",
      );
    } catch (error) {
      Exception(error);
    }
  }
}
