// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pivot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pivot _$PivotFromJson(Map<String, dynamic> json) => Pivot(
      modelId: json['model_id'] as int?,
      roleId: json['role_id'] as int?,
      modelType: json['model_type'] as String?,
    );

Map<String, dynamic> _$PivotToJson(Pivot instance) => <String, dynamic>{
      'model_id': instance.modelId,
      'role_id': instance.roleId,
      'model_type': instance.modelType,
    };
