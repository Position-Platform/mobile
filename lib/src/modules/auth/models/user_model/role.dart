import 'dart:convert';

import 'pivot.dart';

class Role {
  int? id;
  String? name;
  String? guardName;
  DateTime? createdAt;
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

  factory Role.fromMap(Map<String, dynamic> data) => Role(
        id: data['id'] as int?,
        name: data['name'] as String?,
        guardName: data['guard_name'] as String?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        pivot: data['pivot'] == null
            ? null
            : Pivot.fromMap(data['pivot'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'guard_name': guardName,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'pivot': pivot?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Role].
  factory Role.fromJson(String data) {
    return Role.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Role] to a JSON string.
  String toJson() => json.encode(toMap());

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
