// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batiment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Batiment _$BatimentFromJson(Map<String, dynamic> json) => Batiment(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      nom: json['nom'] as String?,
      nombreNiveau: json['nombre_niveau'] as String?,
      code: json['code'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      image: json['image'],
      indication: json['indication'] as String?,
      rue: json['rue'] as String?,
      ville: json['ville'] as String?,
      commune: json['commune'] as String?,
      quartier: json['quartier'] as String?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$BatimentToJson(Batiment instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'nom': instance.nom,
      'nombre_niveau': instance.nombreNiveau,
      'code': instance.code,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'image': instance.image,
      'indication': instance.indication,
      'rue': instance.rue,
      'ville': instance.ville,
      'commune': instance.commune,
      'quartier': instance.quartier,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
