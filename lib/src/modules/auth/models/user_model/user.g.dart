// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      phone: json['phone'],
      fcmToken: json['fcm_token'],
      imageProfil: json['image_profil'] as String?,
      abonnementId: json['abonnement_id'] as int?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      abonnement: json['abonnement'] == null
          ? null
          : Abonnement.fromJson(json['abonnement'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
      'phone': instance.phone,
      'fcm_token': instance.fcmToken,
      'image_profil': instance.imageProfil,
      'abonnement_id': instance.abonnementId,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'roles': instance.roles,
      'abonnement': instance.abonnement,
    };
