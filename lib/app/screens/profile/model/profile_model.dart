class ProfileModel {
  String? message;
  ProfileData? data;

  ProfileModel({this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new ProfileData.fromJson(json['data']) : null;
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

class ProfileData {
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

  ProfileData(
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

  ProfileData.fromJson(Map<String, dynamic> json) {
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