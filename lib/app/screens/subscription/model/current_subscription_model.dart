class CurrentSubscriptionModel {
  String? message;
  CurrentSubscriptionData? data;

  CurrentSubscriptionModel({this.message, this.data});

  CurrentSubscriptionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? CurrentSubscriptionData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = message;
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
  SubscriptionLimits? limits;

  CurrentSubscriptionData({
    this.name,
    this.metadata,
    this.amount,
    this.payment,
    this.startDate,
    this.endDate,
    this.limits,
  });

  CurrentSubscriptionData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    amount = json['amount'];
    payment = json['payment'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    limits = json['limits'] != null ? SubscriptionLimits.fromJson(json['limits']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['amount'] = amount;
    data['payment'] = payment;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    if (limits != null) {
      data['limits'] = limits!.toJson();
    }
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

  Metadata({this.admins, this.companies, this.employees, this.projects, this.reminders, this.tasks});

  Metadata.fromJson(Map<String, dynamic> json) {
    admins = json['admins'];
    companies = json['companies'];
    employees = json['employees'];
    projects = json['projects'];
    reminders = json['reminders'];
    tasks = json['tasks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['admins'] = admins;
    data['companies'] = companies;
    data['employees'] = employees;
    data['projects'] = projects;
    data['reminders'] = reminders;
    data['tasks'] = tasks;
    return data;
  }
}

class SubscriptionLimits {
  MaxLimits? max;
  AvailableLimits? available;

  SubscriptionLimits({this.max, this.available});

  SubscriptionLimits.fromJson(Map<String, dynamic> json) {
    max = json['max'] != null ? MaxLimits.fromJson(json['max']) : null;
    available = json['available'] != null ? AvailableLimits.fromJson(json['available']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (max != null) {
      data['max'] = max!.toJson();
    }
    if (available != null) {
      data['available'] = available!.toJson();
    }
    return data;
  }
}

class MaxLimits {
  int? maxCompanies;
  int? maxWorkers;
  int? maxAdmins;
  int? maxProjects;
  int? maxTasks;
  int? maxReminders;

  MaxLimits({this.maxCompanies, this.maxWorkers, this.maxAdmins, this.maxProjects, this.maxTasks, this.maxReminders});

  MaxLimits.fromJson(Map<String, dynamic> json) {
    maxCompanies = json['maxCompanies'];
    maxWorkers = json['maxWorkers'];
    maxAdmins = json['maxAdmins'];
    maxProjects = json['maxProjects'];
    maxTasks = json['maxTasks'];
    maxReminders = json['maxReminders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['maxCompanies'] = maxCompanies;
    data['maxWorkers'] = maxWorkers;
    data['maxAdmins'] = maxAdmins;
    data['maxProjects'] = maxProjects;
    data['maxTasks'] = maxTasks;
    data['maxReminders'] = maxReminders;
    return data;
  }
}

class AvailableLimits {
  int? companies;
  int? workers;
  int? admins;
  int? projects;
  int? tasks;
  int? reminders;

  AvailableLimits({this.companies, this.workers, this.admins, this.projects, this.tasks, this.reminders});

  AvailableLimits.fromJson(Map<String, dynamic> json) {
    companies = json['companies'];
    workers = json['workers'];
    admins = json['admins'];
    projects = json['projects'];
    tasks = json['tasks'];
    reminders = json['reminders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['companies'] = companies;
    data['workers'] = workers;
    data['admins'] = admins;
    data['projects'] = projects;
    data['tasks'] = tasks;
    data['reminders'] = reminders;
    return data;
  }
}
