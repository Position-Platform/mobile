// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types_commodite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypesCommodite _$TypesCommoditeFromJson(Map<String, dynamic> json) =>
    TypesCommodite(
      id: json['id'] as int?,
      nom: json['nom'] as String?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      commodites: (json['commodites'] as List<dynamic>?)
          ?.map((e) => Commodite.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TypesCommoditeToJson(TypesCommodite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'commodites': instance.commodites,
    };
