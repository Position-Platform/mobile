// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      nom: json['nom'] as String?,
      batimentId: json['batiment_id'] as int?,
      indicationAdresse: json['indication_adresse'] as String?,
      codePostal: json['code_postal'] as String?,
      siteInternet: json['site_internet'] as String?,
      nomManager: json['nom_manager'] as String?,
      contactManager: json['contact_manager'] as String?,
      userId: json['user_id'] as int?,
      etage: json['etage'] as int?,
      cover: json['cover'] as String?,
      phone: json['phone'] as String?,
      whatsapp1: json['whatsapp1'] as String?,
      whatsapp2: json['whatsapp2'] as String?,
      description: json['description'] as String?,
      osmId: json['osm_id'] as String?,
      services: json['services'] as String?,
      ameliorations: json['ameliorations'] as String?,
      vues: json['vues'] as int?,
      logo: json['logo'] as String?,
      logoMap: json['logo_map'] as String?,
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isFavoris: json['isFavoris'] as bool?,
      isopen: json['isopen'] as bool?,
      moyenne: json['moyenne'],
      avis: json['avis'] as int?,
      count: (json['count'] as List<dynamic>?)
          ?.map((e) => Count.fromJson(e as Map<String, dynamic>))
          .toList(),
      batiment: json['batiment'] == null
          ? null
          : Batiment.fromJson(json['batiment'] as Map<String, dynamic>),
      sousCategories: (json['sous_categories'] as List<dynamic>?)
          ?.map((e) => SousCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      commodites: (json['commodites'] as List<dynamic>?)
          ?.map((e) => Commodite.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      horaires: (json['horaires'] as List<dynamic>?)
          ?.map((e) => Horaire.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentaires: (json['commentaires'] as List<dynamic>?)
          ?.map((e) => Commentaire.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      distance: (json['distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'batiment_id': instance.batimentId,
      'indication_adresse': instance.indicationAdresse,
      'code_postal': instance.codePostal,
      'site_internet': instance.siteInternet,
      'nom_manager': instance.nomManager,
      'contact_manager': instance.contactManager,
      'user_id': instance.userId,
      'etage': instance.etage,
      'cover': instance.cover,
      'phone': instance.phone,
      'whatsapp1': instance.whatsapp1,
      'whatsapp2': instance.whatsapp2,
      'description': instance.description,
      'osm_id': instance.osmId,
      'services': instance.services,
      'ameliorations': instance.ameliorations,
      'vues': instance.vues,
      'logo': instance.logo,
      'logo_map': instance.logoMap,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'isFavoris': instance.isFavoris,
      'isopen': instance.isopen,
      'moyenne': instance.moyenne,
      'avis': instance.avis,
      'count': instance.count,
      'batiment': instance.batiment,
      'sous_categories': instance.sousCategories,
      'commodites': instance.commodites,
      'images': instance.images,
      'horaires': instance.horaires,
      'commentaires': instance.commentaires,
      'user': instance.user,
      'distance': instance.distance,
    };
