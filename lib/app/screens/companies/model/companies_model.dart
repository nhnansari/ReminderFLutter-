class CompaniesModel {
  final String message;
  final List<Company> companies;

  CompaniesModel({
    this.message = '',
    this.companies = const [],
  });

  factory CompaniesModel.fromJson(Map<String, dynamic> json) {
    return CompaniesModel(
      message: json['message'] as String? ?? '',
      companies: (json['companies'] as List<dynamic>? ?? [])
          .map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'companies': companies.map((e) => e.toJson()).toList(),
    };
  }
}

class Company {
  final int? id;
  final String? name;
  final String? subdomain;
  final String? database;
  final int? userId;
  final String? logo;
  final bool? isActive;
  final bool? suspended;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Company({
    this.id,
    this.name,
    this.subdomain,
    this.database,
    this.userId,
    this.logo,
    this.isActive,
    this.suspended,
    this.createdAt,
    this.updatedAt,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'] as int?,
      name: json['name'] as String?,
      subdomain: json['subdomain'] as String?,
      database: json['database'] as String?,
      userId: json['userId'] as int?,
      logo: json['logo'] as String?,
      isActive: json['isActive'] as bool?,
      suspended: json['suspended'] as bool?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'subdomain': subdomain,
      'database': database,
      'userId': userId,
      'logo': logo,
      'isActive': isActive,
      'suspended': suspended,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}