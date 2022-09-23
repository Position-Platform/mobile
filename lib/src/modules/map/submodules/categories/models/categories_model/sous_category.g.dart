// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sous_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SousCategory _$SousCategoryFromJson(Map<String, dynamic> json) => SousCategory(
      id: json['id'] as int?,
      nom: json['nom'] as String?,
      categorieId: json['categorie_id'] as int?,
      logourl: json['logourl'],
      logourlmap: json['logourlmap'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      category: json['categorie'] == null
          ? null
          : Category.fromJson(json['categorie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SousCategoryToJson(SousCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'categorie_id': instance.categorieId,
      'logourl': instance.logourl,
      'logourlmap': instance.logourlmap,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'categorie': instance.category,
    };
