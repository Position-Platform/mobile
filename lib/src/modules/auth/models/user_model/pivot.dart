import 'dart:convert';

class Pivot {
  int? modelId;
  int? roleId;
  String? modelType;

  Pivot({this.modelId, this.roleId, this.modelType});

  @override
  String toString() {
    return 'Pivot(modelId: $modelId, roleId: $roleId, modelType: $modelType)';
  }

  factory Pivot.fromMap(Map<String, dynamic> data) => Pivot(
        modelId: data['model_id'] as int?,
        roleId: data['role_id'] as int?,
        modelType: data['model_type'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'model_id': modelId,
        'role_id': roleId,
        'model_type': modelType,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Pivot].
  factory Pivot.fromJson(String data) {
    return Pivot.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Pivot] to a JSON string.
  String toJson() => json.encode(toMap());

  Pivot copyWith({
    int? modelId,
    int? roleId,
    String? modelType,
  }) {
    return Pivot(
      modelId: modelId ?? this.modelId,
      roleId: roleId ?? this.roleId,
      modelType: modelType ?? this.modelType,
    );
  }
}
