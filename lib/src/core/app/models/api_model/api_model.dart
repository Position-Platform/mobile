import 'package:json_annotation/json_annotation.dart';

part 'api_model.g.dart';

@JsonSerializable()
class ApiModel {
  bool? success;
  String? data;
  String? message;

  ApiModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'ApiModel(success: $success, data: $data, message: $message)';
  }

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return _$ApiModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiModelToJson(this);

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
