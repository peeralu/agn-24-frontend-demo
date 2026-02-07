class UserModel {
  UserModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.roles,
  });

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isActive;
  final String? uid;
  final String? firstName;
  final String? lastName;
  final String? image;
  final List<RoleModel> roles;

  UserModel copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isActive,
    String? uid,
    String? firstName,
    String? lastName,
    String? image,
    List<RoleModel>? roles,
  }) {
    return UserModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isActive: isActive ?? this.isActive,
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      image: image ?? this.image,
      roles: roles ?? this.roles,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      isActive: json["isActive"],
      uid: json["uid"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      image: json["image"],
      roles: json["roles"] == null ? [] : List<RoleModel>.from(json["roles"]!.map((x) => RoleModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "isActive": isActive,
    "uid": uid,
    "firstName": firstName,
    "lastName": lastName,
    "image": image,
    "roles": roles.map((x) => x.toJson()).toList(),
  };

  List<Object?> get table {
    final role = roles.isNotEmpty ? roles.first.name ?? '-' : '-';
    return [id?.toString() ?? "-", "$firstName $lastName", role, updatedAt, isActive];
  }

  String get fullName => '${firstName?.toUpperCase() ?? ""} ${lastName?.toUpperCase() ?? ""}';
  String get roleName => roles.isNotEmpty ? roles.first.name ?? '-' : '-';
}

class RoleModel {
  RoleModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.code,
    required this.name,
    required this.permissions,
  });

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isActive;
  final String? code;
  final String? name;
  final dynamic permissions;

  RoleModel copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isActive,
    String? code,
    String? name,
    dynamic permissions,
  }) {
    return RoleModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isActive: isActive ?? this.isActive,
      code: code ?? this.code,
      name: name ?? this.name,
      permissions: permissions ?? this.permissions,
    );
  }

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      id: json["id"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      isActive: json["isActive"],
      code: json["code"],
      name: json["name"],
      permissions: json["permissions"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "isActive": isActive,
    "code": code,
    "name": name,
    "permissions": permissions,
  };
}
