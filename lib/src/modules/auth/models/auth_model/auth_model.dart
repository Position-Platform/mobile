import 'dart:convert';

import 'data.dart';

class AuthModel {
  bool? success;
  Data? data;
  String? message;

  AuthModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'AuthModel(success: $success, data: $data, message: $message)';
  }

  factory AuthModel.fromMap(Map<String, dynamic> data) => AuthModel(
        success: data['success'] as bool?,
        data: data['data'] == null
            ? null
            : Data.fromMap(data['data'] as Map<String, dynamic>),
        message: data['message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'success': success,
        'data': data?.toMap(),
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AuthModel].
  factory AuthModel.fromJson(String data) {
    return AuthModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AuthModel] to a JSON string.
  String toJson() => json.encode(toMap());

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
