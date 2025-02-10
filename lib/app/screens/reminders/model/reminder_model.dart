class ReminderModel {
  String? message;
  List<ReminderData>? data;

  ReminderModel({this.message, this.data});

  ReminderModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <ReminderData>[];
      json['data'].forEach((v) {
        data!.add(new ReminderData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReminderData {
  int? id;
  int? companyId;
  String? taskId;
  int? reminderMessageId;
  String? createdBy;
  String? reminderDate;
  int? userId;
  int? teamId;
  String? isSent;
  String? createdAt;
  String? updatedAt;
  String? task;
  ReminderMessage? reminderMessage;

  ReminderData(
      {this.id,
      this.companyId,
      this.taskId,
      this.reminderMessageId,
      this.createdBy,
      this.reminderDate,
      this.userId,
      this.teamId,
      this.isSent,
      this.createdAt,
      this.updatedAt,
      this.task,
      this.reminderMessage});

  ReminderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['companyId'];
    taskId = json['taskId'];
    reminderMessageId = json['reminderMessageId'];
    createdBy = json['createdBy'];
    reminderDate = json['reminderDate'];
    userId = json['userId'];
    teamId = json['teamId'];
    isSent = json['isSent'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    task = json['task'];
    reminderMessage = json['reminderMessage'] != null
        ? new ReminderMessage.fromJson(json['reminderMessage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyId'] = this.companyId;
    data['taskId'] = this.taskId;
    data['reminderMessageId'] = this.reminderMessageId;
    data['createdBy'] = this.createdBy;
    data['reminderDate'] = this.reminderDate;
    data['userId'] = this.userId;
    data['teamId'] = this.teamId;
    data['isSent'] = this.isSent;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['task'] = this.task;
    if (this.reminderMessage != null) {
      data['reminderMessage'] = this.reminderMessage!.toJson();
    }
    return data;
  }
}

class ReminderMessage {
  int? id;
  int? companyId;
  String? message;
  String? createdAt;
  String? updatedAt;
  List<Options>? options;

  ReminderMessage(
      {this.id,
      this.companyId,
      this.message,
      this.createdAt,
      this.updatedAt,
      this.options});

  ReminderMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['companyId'];
    message = json['message'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyId'] = this.companyId;
    data['message'] = this.message;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  int? id;
  int? reminderMessageId;
  String? option;
  String? nature;
  int? companyId;
  bool? movesTask;
  String? taskStageId;
  String? createdAt;
  String? updatedAt;

  Options(
      {this.id,
      this.reminderMessageId,
      this.option,
      this.nature,
      this.companyId,
      this.movesTask,
      this.taskStageId,
      this.createdAt,
      this.updatedAt});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reminderMessageId = json['reminderMessageId'];
    option = json['option'];
    nature = json['nature'];
    companyId = json['companyId'];
    movesTask = json['movesTask'];
    taskStageId = json['taskStageId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reminderMessageId'] = this.reminderMessageId;
    data['option'] = this.option;
    data['nature'] = this.nature;
    data['companyId'] = this.companyId;
    data['movesTask'] = this.movesTask;
    data['taskStageId'] = this.taskStageId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}