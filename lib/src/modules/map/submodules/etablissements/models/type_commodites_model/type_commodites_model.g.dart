// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_commodites_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeCommoditesModel _$TypeCommoditesModelFromJson(Map<String, dynamic> json) =>
    TypeCommoditesModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$TypeCommoditesModelToJson(
        TypeCommoditesModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
