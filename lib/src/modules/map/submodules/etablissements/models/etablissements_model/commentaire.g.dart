// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commentaire _$CommentaireFromJson(Map<String, dynamic> json) => Commentaire(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      commentaire: json['commentaire'] as String?,
      rating: json['rating'] as int?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentaireToJson(Commentaire instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'commentaire': instance.commentaire,
      'rating': instance.rating,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'user': instance.user,
    };
