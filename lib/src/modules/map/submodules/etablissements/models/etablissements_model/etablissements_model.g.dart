// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etablissements_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EtablissementsModel _$EtablissementsModelFromJson(Map<String, dynamic> json) =>
    EtablissementsModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$EtablissementsModelToJson(
        EtablissementsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
