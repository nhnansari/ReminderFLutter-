class TeamModel {
  String? message;
  List<TeamData>? data;

  TeamModel({this.message, this.data});

  TeamModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <TeamData>[];
      json['data'].forEach((v) {
        data!.add(new TeamData.fromJson(v));
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

class TeamData {
  int? id;
  String? name;
  String? description;
  int? companyId;
  String? createdAt;
  String? updatedAt;

  TeamData(
      {this.id,
      this.name,
      this.description,
      this.companyId,
      this.createdAt,
      this.updatedAt});

  TeamData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    companyId = json['companyId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['companyId'] = this.companyId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}