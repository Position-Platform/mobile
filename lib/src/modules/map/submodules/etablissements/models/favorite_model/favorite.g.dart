// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Favorite _$FavoriteFromJson(Map<String, dynamic> json) => Favorite(
      etablissementId: json['etablissement_id'] as int?,
      userId: json['user_id'] as int?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$FavoriteToJson(Favorite instance) => <String, dynamic>{
      'etablissement_id': instance.etablissementId,
      'user_id': instance.userId,
      'id': instance.id,
    };
