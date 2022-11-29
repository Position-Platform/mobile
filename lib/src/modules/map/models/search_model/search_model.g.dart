// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      name: json['name'] as String?,
      id: json['id'] as String?,
      type: json['type'] as String?,
      logo: json['logo'] as String?,
      logomap: json['logomap'] as String?,
      details: json['details'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      features: json['features'] == null
          ? null
          : Features.fromJson(json['features'] as Map<String, dynamic>),
      etablissement: json['etablissement'] == null
          ? null
          : Datum.fromJson(json['etablissement'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      isOpenNow: json['isOpenNow'] as bool?,
      distance: (json['distance'] as num?)?.toDouble(),
      plageDay: json['plageDay'] as String?,
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
      'logo': instance.logo,
      'logomap': instance.logomap,
      'details': instance.details,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'features': instance.features,
      'etablissement': instance.etablissement,
      'category': instance.category,
      'isOpenNow': instance.isOpenNow,
      'distance': instance.distance,
      'plageDay': instance.plageDay,
    };
