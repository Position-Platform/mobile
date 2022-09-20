// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etablissement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EtablissementModel _$EtablissementModelFromJson(Map<String, dynamic> json) =>
    EtablissementModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$EtablissementModelToJson(EtablissementModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
