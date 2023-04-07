// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int?,
      nom: json['nom'] as String?,
      shortname: json['shortname'] as String?,
      logourl: json['logourl'] as String?,
      logourlmap: json['logourlmap'] as String?,
      color: json['color'] as String?,
      vues: json['vues'] as int?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      sousCategories: (json['sous_categories'] as List<dynamic>?)
          ?.map((e) => SousCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'shortname': instance.shortname,
      'logourl': instance.logourl,
      'logourlmap': instance.logourlmap,
      'color': instance.color,
      'vues': instance.vues,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'sous_categories': instance.sousCategories,
    };
