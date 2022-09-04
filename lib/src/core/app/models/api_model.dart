import 'dart:convert';

class ApiModel {
  bool? success;
  String? data;
  String? message;

  ApiModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'ApiModel(success: $success, data: $data, message: $message)';
  }

  factory ApiModel.fromMap(Map<String, dynamic> data) => ApiModel(
        success: data['success'] as bool?,
        data: data['data'] as String?,
        message: data['message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'success': success,
        'data': data,
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ApiModel].
  factory ApiModel.fromJson(String data) {
    return ApiModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ApiModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ApiModel copyWith({
    bool? success,
    String? data,
    String? message,
  }) {
    return ApiModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
