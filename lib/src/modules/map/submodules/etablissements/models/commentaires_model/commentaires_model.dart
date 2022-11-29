import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'commentaires_model.g.dart';

@JsonSerializable()
class CommentairesModel {
  bool? success;
  Data? data;
  String? message;

  CommentairesModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'CommentairesModel(success: $success, data: $data, message: $message)';
  }

  factory CommentairesModel.fromJson(Map<String, dynamic> json) {
    return _$CommentairesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommentairesModelToJson(this);

  CommentairesModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) {
    return CommentairesModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
