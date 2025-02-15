class InvitedUsersModel {
  String? message;
  List<InvitedUsersData>? data;

  InvitedUsersModel({this.message, this.data});

  InvitedUsersModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <InvitedUsersData>[];
      json['data'].forEach((v) {
        data!.add(new InvitedUsersData.fromJson(v));
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

class InvitedUsersData {
  int? id;
  String? companyId;
  String? userId;
  String? email;
  String? role;
  String? password;
  int? verificationCode;
  String? createdAt;
  String? updatedAt;

  InvitedUsersData(
      {this.id,
      this.companyId,
      this.userId,
      this.email,
      this.role,
      this.password,
      this.verificationCode,
      this.createdAt,
      this.updatedAt});

  InvitedUsersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['companyId'];
    userId = json['userId'];
    email = json['email'];
    role = json['role'];
    password = json['password'];
    verificationCode = json['verificationCode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyId'] = this.companyId;
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['role'] = this.role;
    data['password'] = this.password;
    data['verificationCode'] = this.verificationCode;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}