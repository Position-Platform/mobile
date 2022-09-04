import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  bool? success;
  Data? data;
  String? message;

  AuthModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'AuthModel(success: $success, data: $data, message: $message)';
  }

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return _$AuthModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);

  AuthModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) {
    return AuthModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
