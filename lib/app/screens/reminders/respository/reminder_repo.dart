
import 'package:admin/app/api/api.dart';
import 'package:admin/app/api/api_endpoints.dart';

class ReminderRepo extends ApiClient {
  ReminderRepo() : super();

  Future<dynamic> getReminders({required String parameter}) async {
    try {
      return await apiClientRequest(
        endPoint: kGetWorkerReminder,
        body: [],
        parameter: parameter,
        method: "GET",
      );
    } catch (error) {
      Exception(error);
    }
  }
   Future<dynamic> getReminderReply({required String parameter}) async {
    try {
      return await apiClientRequest(
        endPoint: kCompnayReminders,
        body: [],
        parameter: parameter,
        method: "GET",
      );
    } catch (error) {
      Exception(error);
    }
  }
  Future<dynamic> sendReminder({required  Map<String,dynamic> body}) async {
    try {
      return await apiClientRequest(
        endPoint: kReminder,
   
        body: body,
        method: "POST",
      );
    } catch (error) {
      Exception(error);
    }
  }

 Future<dynamic> replyReminder({required  Map<String,dynamic> body }) async {
    try {
      return await apiClientRequest(
        endPoint: kReplyReminder,
        
   
        body: body,
        method: "POST",
      );
    } catch (error) {
      Exception(error);
    }
  }


  //  Future<dynamic> updateTeam({required  Map<String,dynamic> body , required String parameter}) async {
  //   try {
  //     return await apiClientRequest(
  //       endPoint: kTeams,
  //   parameter: parameter,
  //       body: body,
  //       method: "PUT",
  //     );
  //   } catch (error) {
  //     Exception(error);
  //   }
  // }
   Future<dynamic> deleteReminders({required  String parameter ,required  Map<String,dynamic> body  }) async {
    try {
      return await apiClientRequest(
        endPoint: kReminder,
   
        body: body,
        parameter: parameter,
        method: "DELETE",
      );
    } catch (error) {
      Exception(error);
    }
  }
}
