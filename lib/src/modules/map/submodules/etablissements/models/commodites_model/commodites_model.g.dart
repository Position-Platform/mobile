// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodites_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommoditesModel _$CommoditesModelFromJson(Map<String, dynamic> json) =>
    CommoditesModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CommoditesModelToJson(CommoditesModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
