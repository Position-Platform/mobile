// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batiment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Batiment _$BatimentFromJson(Map<String, dynamic> json) => Batiment(
      id: json['id'] as int?,
      nom: json['nom'] as String?,
      nombreNiveau: json['nombre_niveau'] as int?,
      code: json['code'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      image: json['image'],
      indication: json['indication'] as String?,
      rue: json['rue'] as String?,
      ville: json['ville'] as String?,
      commune: json['commune'] as String?,
      quartier: json['quartier'] as String?,
    );

Map<String, dynamic> _$BatimentToJson(Batiment instance) => <String, dynamic>{
      'id': instance.id,
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
    };
