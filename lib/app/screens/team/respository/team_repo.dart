
import '../../../api/api.dart';
import '../../../api/api_endpoints.dart';

class TeamRepo extends ApiClient {
  TeamRepo() : super();

  Future<dynamic> getTeams({required String parameter}) async {
    try {
      return await apiClientRequest(
        endPoint: kTeams,
        body: [],
        parameter: parameter,
        method: "GET",
      );
    } catch (error) {
      Exception(error);
    }
  }
   Future<dynamic> getMembers({required String parameter}) async {
    try {
      return await apiClientRequest(
        endPoint: kTeams,
        body: [],
        parameter: parameter,
        method: "GET",
      );
    } catch (error) {
      Exception(error);
    }
  }
  Future<dynamic> addTeam({required  Map<String,dynamic> body}) async {
    try {
      return await apiClientRequest(
        endPoint: kTeams,
   
        body: body,
        method: "POST",
      );
    } catch (error) {
      Exception(error);
    }
  }

 Future<dynamic> addWorker({required  Map<String,dynamic> body , parameter}) async {
    try {
      return await apiClientRequest(
        endPoint: kAddWorker,
        parameter: parameter,
   
        body: body,
        method: "POST",
      );
    } catch (error) {
      Exception(error);
    }
  }
   Future<dynamic> deleteTeamWorker({required  Map<String,dynamic> body , parameter}) async {
    try {
      return await apiClientRequest(
        endPoint: kAddWorker,
        parameter: parameter,
   
        body: body,
        method: "DELETE",
      );
    } catch (error) {
      Exception(error);
    }
  }


   Future<dynamic> updateTeam({required  Map<String,dynamic> body , required String parameter}) async {
    try {
      return await apiClientRequest(
        endPoint: kTeams,
    parameter: parameter,
        body: body,
        method: "PUT",
      );
    } catch (error) {
      Exception(error);
    }
  }
   Future<dynamic> deleteTeam({required  String parameter ,required  Map<String,dynamic> body  }) async {
    try {
      return await apiClientRequest(
        endPoint: kTeams,
   
        body: body,
        parameter: parameter,
        method: "DELETE",
      );
    } catch (error) {
      Exception(error);
    }
  }
}
