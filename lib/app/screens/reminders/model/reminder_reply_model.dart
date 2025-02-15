class ReminderReplyModel {
  String? message;
  ReminderReplyData? data;

  ReminderReplyModel({this.message, this.data});

  ReminderReplyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new ReminderReplyData.fromJson(json['data']) : null;
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

class ReminderReplyData {
  Meta? meta;
  List<Data>? data;

  ReminderReplyData({this.meta, this.data});

  ReminderReplyData.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  int? firstPage;
  String? firstPageUrl;
  String? lastPageUrl;
  String? nextPageUrl;
  String? previousPageUrl;

  Meta(
      {this.total,
      this.perPage,
      this.currentPage,
      this.lastPage,
      this.firstPage,
      this.firstPageUrl,
      this.lastPageUrl,
      this.nextPageUrl,
      this.previousPageUrl});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['perPage'];
    currentPage = json['currentPage'];
    lastPage = json['lastPage'];
    firstPage = json['firstPage'];
    firstPageUrl = json['firstPageUrl'];
    lastPageUrl = json['lastPageUrl'];
    nextPageUrl = json['nextPageUrl'];
    previousPageUrl = json['previousPageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['perPage'] = this.perPage;
    data['currentPage'] = this.currentPage;
    data['lastPage'] = this.lastPage;
    data['firstPage'] = this.firstPage;
    data['firstPageUrl'] = this.firstPageUrl;
    data['lastPageUrl'] = this.lastPageUrl;
    data['nextPageUrl'] = this.nextPageUrl;
    data['previousPageUrl'] = this.previousPageUrl;
    return data;
  }
}

class Data {
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
  String? creator;
  Workers? workers;
  List<Replies>? replies;
  ReminderMessage? reminderMessage;

  Data(
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
      this.creator,
      this.workers,
      this.replies,
      this.reminderMessage});

  Data.fromJson(Map<String, dynamic> json) {
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
    creator = json['creator'];
    workers =
        json['workers'] != null ? new Workers.fromJson(json['workers']) : null;
    if (json['replies'] != null) {
      replies = <Replies>[];
      json['replies'].forEach((v) {
        replies!.add(new Replies.fromJson(v));
      });
    }
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
    data['creator'] = this.creator;
    if (this.workers != null) {
      data['workers'] = this.workers!.toJson();
    }
    if (this.replies != null) {
      data['replies'] = this.replies!.map((v) => v.toJson()).toList();
    }
    if (this.reminderMessage != null) {
      data['reminderMessage'] = this.reminderMessage!.toJson();
    }
    return data;
  }
}

class Workers {
  int? id;
  String? fullName;
  String? email;
  String? stripeCustomerId;
  String? subscriptionId;
  String? subscriptionStatus;
  String? stripeSessionId;
  bool? emailVerified;
  String? verificationCode;
  String? createdAt;
  String? updatedAt;

  Workers(
      {this.id,
      this.fullName,
      this.email,
      this.stripeCustomerId,
      this.subscriptionId,
      this.subscriptionStatus,
      this.stripeSessionId,
      this.emailVerified,
      this.verificationCode,
      this.createdAt,
      this.updatedAt});

  Workers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    stripeCustomerId = json['stripeCustomerId'];
    subscriptionId = json['subscriptionId'];
    subscriptionStatus = json['subscriptionStatus'];
    stripeSessionId = json['stripeSessionId'];
    emailVerified = json['emailVerified'];
    verificationCode = json['verificationCode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['stripeCustomerId'] = this.stripeCustomerId;
    data['subscriptionId'] = this.subscriptionId;
    data['subscriptionStatus'] = this.subscriptionStatus;
    data['stripeSessionId'] = this.stripeSessionId;
    data['emailVerified'] = this.emailVerified;
    data['verificationCode'] = this.verificationCode;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Replies {
  int? id;
  int? reminderId;
  int? userId;
  int? companyId;
  String? reply;
  String? replyNature;
  int? optionId;
  String? createdAt;
  String? updatedAt;

  Replies(
      {this.id,
      this.reminderId,
      this.userId,
      this.companyId,
      this.reply,
      this.replyNature,
      this.optionId,
      this.createdAt,
      this.updatedAt});

  Replies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reminderId = json['reminderId'];
    userId = json['userId'];
    companyId = json['companyId'];
    reply = json['reply'];
    replyNature = json['replyNature'];
    optionId = json['optionId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reminderId'] = this.reminderId;
    data['userId'] = this.userId;
    data['companyId'] = this.companyId;
    data['reply'] = this.reply;
    data['replyNature'] = this.replyNature;
    data['optionId'] = this.optionId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
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
