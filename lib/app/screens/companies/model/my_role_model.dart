class MyRoleModel {
  int? id;
  int? userId;
  int? companyId;
  String? roleName;
  String? createdAt;
  String? updatedAt;

  MyRoleModel(
      {this.id,
      this.userId,
      this.companyId,
      this.roleName,
      this.createdAt,
      this.updatedAt});

  MyRoleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    companyId = json['companyId'];
    roleName = json['roleName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['companyId'] = this.companyId;
    data['roleName'] = this.roleName;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}