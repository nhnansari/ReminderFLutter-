class CompanyUserModel {
  String? message;
  List<CompanyUserData>? data;

  CompanyUserModel({this.message, this.data});

  CompanyUserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <CompanyUserData>[];
      json['data'].forEach((v) {
        data!.add(CompanyUserData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = message;
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
  String? role;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  User? user;

  CompanyUserData({
    this.id,
    this.companyId,
    this.userId,
    this.roleId,
    this.role,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  CompanyUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['companyId'];
    userId = json['userId'];
    roleId = json['roleId'];
    role = json['role'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['companyId'] = companyId;
    data['userId'] = userId;
    data['roleId'] = roleId;
    data['role'] = role;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
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

  User({
    this.id,
    this.fullName,
    this.email,
    this.stripeCustomerId,
    this.subscriptionId,
    this.subscriptionStatus,
    this.stripeSessionId,
    this.emailVerified,
    this.verificationCode,
    this.createdAt,
    this.updatedAt,
  });

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
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['fullName'] = fullName;
    data['email'] = email;
    data['stripeCustomerId'] = stripeCustomerId;
    data['subscriptionId'] = subscriptionId;
    data['subscriptionStatus'] = subscriptionStatus;
    data['stripeSessionId'] = stripeSessionId;
    data['emailVerified'] = emailVerified;
    data['verificationCode'] = verificationCode;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}