// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commodite _$CommoditeFromJson(Map<String, dynamic> json) => Commodite(
      id: json['id'] as int?,
      nom: json['nom'] as String?,
      typeCommoditeId: json['type_commodite_id'] as int?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      typeCommodite: json['type_commodite'] == null
          ? null
          : TypesCommodite.fromJson(
              json['type_commodite'] as Map<String, dynamic>),
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$CommoditeToJson(Commodite instance) => <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'type_commodite_id': instance.typeCommoditeId,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'type_commodite': instance.typeCommodite,
      'isSelected': instance.isSelected,
    };
