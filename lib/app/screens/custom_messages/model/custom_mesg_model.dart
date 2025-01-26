
class CustomMessageModel {
  String? message;
  List<ReminderMessages>? reminderMessages;

  CustomMessageModel({this.message, this.reminderMessages});

  CustomMessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['reminderMessages'] != null) {
      reminderMessages = <ReminderMessages>[];
      json['reminderMessages'].forEach((v) {
        reminderMessages!.add(new ReminderMessages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.reminderMessages != null) {
      data['reminderMessages'] =
          this.reminderMessages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReminderMessages {
  int? id;
  int? companyId;
  String? message;
  String? createdAt;
  String? updatedAt;
  List<Options>? options;

  ReminderMessages(
      {this.id,
      this.companyId,
      this.message,
      this.createdAt,
      this.updatedAt,
      this.options});

  ReminderMessages.fromJson(Map<String, dynamic> json) {
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
  Null taskStageId;
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

