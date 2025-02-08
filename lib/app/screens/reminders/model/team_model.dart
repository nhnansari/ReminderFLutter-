class TeamModel {
  String? message;
  List<TeamData>? data;

  TeamModel({this.message, this.data});

  TeamModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <TeamData>[];
      json['data'].forEach((v) {
        data!.add(TeamData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    jsonData['message'] = message;
    if (data != null) {
      jsonData['data'] = data!.map((v) => v.toJson()).toList();
    }
    return jsonData;
  }
}

class TeamData {
  int? id;
  String? name;
  String? description;
  int? companyId;
  String? createdAt;
  String? updatedAt;
  List<TeamMember>? members;

  TeamData({
    this.id,
    this.name,
    this.description,
    this.companyId,
    this.createdAt,
    this.updatedAt,
    this.members,
  });

  TeamData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    companyId = json['companyId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['members'] != null) {
      members = <TeamMember>[];
      json['members'].forEach((v) {
        members!.add(TeamMember.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    jsonData['id'] = id;
    jsonData['name'] = name;
    jsonData['description'] = description;
    jsonData['companyId'] = companyId;
    jsonData['createdAt'] = createdAt;
    jsonData['updatedAt'] = updatedAt;
    if (members != null) {
      jsonData['members'] = members!.map((v) => v.toJson()).toList();
    }
    return jsonData;
  }
}

class TeamMember {
  int? id;
  String? fullName;
  String? email;
  String? stripeCustomerId;
  dynamic subscriptionId;
  dynamic subscriptionStatus;
  String? stripeSessionId;
  bool? emailVerified;
  dynamic verificationCode;
  String? createdAt;
  String? updatedAt;

  TeamMember({
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

  TeamMember.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> jsonData = {};
    jsonData['id'] = id;
    jsonData['fullName'] = fullName;
    jsonData['email'] = email;
    jsonData['stripeCustomerId'] = stripeCustomerId;
    jsonData['subscriptionId'] = subscriptionId;
    jsonData['subscriptionStatus'] = subscriptionStatus;
    jsonData['stripeSessionId'] = stripeSessionId;
    jsonData['emailVerified'] = emailVerified;
    jsonData['verificationCode'] = verificationCode;
    jsonData['createdAt'] = createdAt;
    jsonData['updatedAt'] = updatedAt;
    return jsonData;
  }
}