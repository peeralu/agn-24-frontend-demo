import 'package:jiffy/jiffy.dart';

class Company {
  Company({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.isActive,
    required this.code,
    required this.name,
  });

  final int? id;
  final Jiffy? createdAt;
  final Jiffy? updatedAt;
  final Jiffy? deletedAt;
  final bool? isActive;
  final String? code;
  final String? name;

  Company copyWith({
    int? id,
    Jiffy? createdAt,
    Jiffy? updatedAt,
    Jiffy? deletedAt,
    bool? isActive,
    String? code,
    String? name,
  }) {
    return Company(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      isActive: isActive ?? this.isActive,
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  factory Company.fromJson(Map<String, dynamic> json) {
    final createdAt = DateTime.tryParse(json["created_at"] ?? "");
    final updatedAt = DateTime.tryParse(json["updated_at"] ?? "");
    final deletedAt = DateTime.tryParse(json["deleted_at"] ?? "");
    return Company(
      id: json["id"],
      createdAt: createdAt != null ? Jiffy.parseFromDateTime(createdAt) : null,
      updatedAt: updatedAt != null ? Jiffy.parseFromDateTime(updatedAt) : null,
      deletedAt: deletedAt != null ? Jiffy.parseFromDateTime(deletedAt) : null,
      isActive: json["is_active"],
      code: json["code"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() {
    final c = createdAt?.dateTime.toIso8601String();
    final u = updatedAt?.dateTime.toIso8601String();
    final d = deletedAt?.dateTime.toIso8601String();
    return {
      "id": id,
      "created_at": c,
      "updated_at": u,
      "deleted_at": d,
      "is_active": isActive,
      "code": code,
      "name": name,
    };
  }

  @override
  String toString() {
    return "$id, $createdAt, $updatedAt, $deletedAt, $isActive, $code, $name, ";
  }

  List<Object?> get table {
    return [id?.toString() ?? "-", name, code, updatedAt, isActive];
  }
}
