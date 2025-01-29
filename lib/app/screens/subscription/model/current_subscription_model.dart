class CurrentSubscriptionModel {
  String? message;
  CurrentSubscriptionData? data;

  CurrentSubscriptionModel({this.message, this.data});

  CurrentSubscriptionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new CurrentSubscriptionData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CurrentSubscriptionData {
  String? name;
  Metadata? metadata;
  int? amount;
  String? payment;
  String? startDate;
  String? endDate;

  CurrentSubscriptionData(
      {this.name,
      this.metadata,
      this.amount,
      this.payment,
      this.startDate,
      this.endDate});

  CurrentSubscriptionData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    amount = json['amount'];
    payment = json['payment'];
    startDate = json['startDate'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['amount'] = this.amount;
    data['payment'] = this.payment;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    return data;
  }
}

class Metadata {
  String? admins;
  String? companies;
  String? employees;
  String? projects;
  String? reminders;
  String? tasks;

  Metadata(
      {this.admins,
      this.companies,
      this.employees,
      this.projects,
      this.reminders,
      this.tasks});

  Metadata.fromJson(Map<String, dynamic> json) {
    admins = json['admins'];
    companies = json['companies'];
    employees = json['employees'];
    projects = json['projects'];
    reminders = json['reminders'];
    tasks = json['tasks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admins'] = this.admins;
    data['companies'] = this.companies;
    data['employees'] = this.employees;
    data['projects'] = this.projects;
    data['reminders'] = this.reminders;
    data['tasks'] = this.tasks;
    return data;
  }
}
