
import '../../../api/api.dart';
import '../../../api/api_endpoints.dart';

class TaskRepo extends ApiClient {
  TaskRepo() : super();

  Future<dynamic> getTasks({required String parameter}) async {
    try {
      return await apiClientRequest(
        endPoint: kCreateTask,
        body: [],
        parameter: parameter,
        method: "GET",
      );
    } catch (error) {
      Exception(error);
    }
  }
  Future<dynamic> createTask({required  Map<String,dynamic> body}) async {
    try {
      return await apiClientRequest(
        endPoint: kCreateTask,
   
        body: body,
        method: "POST",
      );
    } catch (error) {
      Exception(error);
    }
  }

 


   Future<dynamic> updatetask({required  Map<String,dynamic> body , required String parameter}) async {
    try {
      return await apiClientRequest(
        endPoint: kCreateTask,
    parameter: parameter,
        body: body,
        method: "PUT",
      );
    } catch (error) {
      Exception(error);
    }
  }
   Future<dynamic> deleteTask({required  String parameter}) async {
    try {
      return await apiClientRequest(
        endPoint: kCreateTask,
   
        body: [],
        parameter: parameter,
        method: "DELETE",
      );
    } catch (error) {
      Exception(error);
    }
  }
}
