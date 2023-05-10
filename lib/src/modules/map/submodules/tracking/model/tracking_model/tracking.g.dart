// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tracking _$TrackingFromJson(Map<String, dynamic> json) => Tracking(
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      speed: json['speed'] as String?,
      timestamp: json['timestamp'] as String?,
      userId: json['user_id'] as int?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$TrackingToJson(Tracking instance) => <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'speed': instance.speed,
      'timestamp': instance.timestamp,
      'user_id': instance.userId,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
    };
