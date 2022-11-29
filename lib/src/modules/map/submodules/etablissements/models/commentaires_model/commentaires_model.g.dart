// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentaires_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentairesModel _$CommentairesModelFromJson(Map<String, dynamic> json) =>
    CommentairesModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CommentairesModelToJson(CommentairesModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
