class ProjectListModel {
  String? message;
  List<ProjectListData>? data;

  ProjectListModel({this.message, this.data});

  ProjectListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <ProjectListData>[];
      json['data'].forEach((v) {
        data!.add(new ProjectListData.fromJson(v));
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

class ProjectListData {
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
  Company? company;
  CreatedByUser? createdByUser;

  ProjectListData(
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
      this.updatedAt,
      this.company,
      this.createdByUser});

  ProjectListData.fromJson(Map<String, dynamic> json) {
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
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
    createdByUser = json['createdByUser'] != null
        ? new CreatedByUser.fromJson(json['createdByUser'])
        : null;
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
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.createdByUser != null) {
      data['createdByUser'] = this.createdByUser!.toJson();
    }
    return data;
  }
}

class Company {
  int? id;
  String? name;
  String? subdomain;
  String? database;
  int? userId;
  String? logo;
  bool? isActive;
  bool? suspended;
  String? createdAt;
  String? updatedAt;

  Company(
      {this.id,
      this.name,
      this.subdomain,
      this.database,
      this.userId,
      this.logo,
      this.isActive,
      this.suspended,
      this.createdAt,
      this.updatedAt});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subdomain = json['subdomain'];
    database = json['database'];
    userId = json['userId'];
    logo = json['logo'];
    isActive = json['isActive'];
    suspended = json['suspended'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['subdomain'] = this.subdomain;
    data['database'] = this.database;
    data['userId'] = this.userId;
    data['logo'] = this.logo;
    data['isActive'] = this.isActive;
    data['suspended'] = this.suspended;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class CreatedByUser {
  int? id;
  String? fullName;
  String? email;
  Null stripeCustomerId;
  Null subscriptionId;
  Null subscriptionStatus;
  Null stripeSessionId;
  bool? emailVerified;
  Null verificationCode;
  String? createdAt;
  String? updatedAt;

  CreatedByUser(
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

  CreatedByUser.fromJson(Map<String, dynamic> json) {
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