class CompanyUserModel {
  String? message;
  List<CompanyUserData>? data;

  CompanyUserModel({this.message, this.data});

  CompanyUserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <CompanyUserData>[];
      json['data'].forEach((v) {
        data!.add(new CompanyUserData.fromJson(v));
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

class CompanyUserData {
  int? id;
  int? companyId;
  int? userId;
  String? roleId;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  User? user;

  CompanyUserData(
      {this.id,
      this.companyId,
      this.userId,
      this.roleId,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.user});

  CompanyUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['companyId'];
    userId = json['userId'];
    roleId = json['roleId'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyId'] = this.companyId;
    data['userId'] = this.userId;
    data['roleId'] = this.roleId;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
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

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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
