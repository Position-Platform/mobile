// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Horaire _$HoraireFromJson(Map<String, dynamic> json) => Horaire(
      id: json['id'] as int?,
      etablissementId: json['etablissement_id'] as int?,
      jour: json['jour'] as String?,
      plageHoraire: json['plage_horaire'] as String?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$HoraireToJson(Horaire instance) => <String, dynamic>{
      'id': instance.id,
      'etablissement_id': instance.etablissementId,
      'jour': instance.jour,
      'plage_horaire': instance.plageHoraire,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
