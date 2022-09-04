import 'dart:convert';

import 'data.dart';

class UserModel {
  bool? success;
  Data? data;
  String? message;

  UserModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'UserModel(success: $success, data: $data, message: $message)';
  }

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
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
  /// Parses the string and returns the resulting Json object as [UserModel].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserModel] to a JSON string.
  String toJson() => json.encode(toMap());

  UserModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) {
    return UserModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
