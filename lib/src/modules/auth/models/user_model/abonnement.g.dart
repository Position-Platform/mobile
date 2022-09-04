// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abonnement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Abonnement _$AbonnementFromJson(Map<String, dynamic> json) => Abonnement(
      id: json['id'] as int?,
      nom: json['nom'] as String?,
      prix: json['prix'] as int?,
      type: json['type'] as String?,
      duree: json['duree'] as int?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$AbonnementToJson(Abonnement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'prix': instance.prix,
      'type': instance.type,
      'duree': instance.duree,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
