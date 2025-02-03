class TasksModel {
  String? message;
  List<TasksModelData>? data;

  TasksModel({this.message, this.data});

  TasksModel.fromJson(Map<String, dynamic> json) {
     message = json['message'];
    if (json['data'] != null) {
      data = <TasksModelData>[];
      json['data'].forEach((v) {
        data!.add(new TasksModelData.fromJson(v));
      });
    };
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

class TasksModelData {
  int? id;
  String? name;
  String? description;
  int? projectId;
  int? createdBy;
  int? companyId;
  int? stageId;
  String? assignedUser;
  String? assignedTeam;
  String? dueDate;
  String? startDate;
  String? endDate;
  int? priority;
  bool? isCompleted;
  String? createdAt;
  String? updatedAt;
  String? stage;
  Project? project;
  Creator? creator;
  String? assignedUserRelation;
  String? assignedTeamRelation;

  TasksModelData(
      {this.id,
      this.name,
      this.description,
      this.projectId,
      this.createdBy,
      this.companyId,
      this.stageId,
      this.assignedUser,
      this.assignedTeam,
      this.dueDate,
      this.startDate,
      this.endDate,
      this.priority,
      this.isCompleted,
      this.createdAt,
      this.updatedAt,
      this.stage,
      this.project,
      this.creator,
      this.assignedUserRelation,
      this.assignedTeamRelation});

  TasksModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    projectId = json['projectId'];
    createdBy = json['createdBy'];
    companyId = json['companyId'];
    stageId = json['stageId'];
    assignedUser = json['assignedUser'];
    assignedTeam = json['assignedTeam'];
    dueDate = json['dueDate'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    priority = json['priority'];
    isCompleted = json['isCompleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    stage = json['stage'];
    project =
        json['project'] != null ? new Project.fromJson(json['project']) : null;
    creator =
        json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
    assignedUserRelation = json['assignedUserRelation'];
    assignedTeamRelation = json['assignedTeamRelation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['projectId'] = this.projectId;
    data['createdBy'] = this.createdBy;
    data['companyId'] = this.companyId;
    data['stageId'] = this.stageId;
    data['assignedUser'] = this.assignedUser;
    data['assignedTeam'] = this.assignedTeam;
    data['dueDate'] = this.dueDate;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['priority'] = this.priority;
    data['isCompleted'] = this.isCompleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['stage'] = this.stage;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    if (this.creator != null) {
      data['creator'] = this.creator!.toJson();
    }
    data['assignedUserRelation'] = this.assignedUserRelation;
    data['assignedTeamRelation'] = this.assignedTeamRelation;
    return data;
  }
}

class Project {
  int? id;
  String? name;
  String? description;
  int? companyId;
  int? createdBy;
  bool? isActive;
  String? startDate;
  String? endDate;
  String? status;
  String? createdAt;
  String? updatedAt;

  Project(
      {this.id,
      this.name,
      this.description,
      this.companyId,
      this.createdBy,
      this.isActive,
      this.startDate,
      this.endDate,
      this.status,
      this.createdAt,
      this.updatedAt});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    companyId = json['companyId'];
    createdBy = json['createdBy'];
    isActive = json['isActive'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['companyId'] = this.companyId;
    data['createdBy'] = this.createdBy;
    data['isActive'] = this.isActive;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Creator {
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

  Creator(
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

  Creator.fromJson(Map<String, dynamic> json) {
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