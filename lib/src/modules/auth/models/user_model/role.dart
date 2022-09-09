import 'package:json_annotation/json_annotation.dart';

import 'pivot.dart';

part 'role.g.dart';

@JsonSerializable()
class Role {
  int? id;
  String? name;
  @JsonKey(name: 'guard_name')
  String? guardName;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  Pivot? pivot;

  Role({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  @override
  String toString() {
    return 'Role(id: $id, name: $name, guardName: $guardName, createdAt: $createdAt, updatedAt: $updatedAt, pivot: $pivot)';
  }

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);

  Role copyWith({
    int? id,
    String? name,
    String? guardName,
    DateTime? createdAt,
    DateTime? updatedAt,
    Pivot? pivot,
  }) {
    return Role(
      id: id ?? this.id,
      name: name ?? this.name,
      guardName: guardName ?? this.guardName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      pivot: pivot ?? this.pivot,
    );
  }
}
