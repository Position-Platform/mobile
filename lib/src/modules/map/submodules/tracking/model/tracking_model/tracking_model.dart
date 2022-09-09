import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'tracking_model.g.dart';

@JsonSerializable()
class TrackingModel {
  bool? success;
  Data? data;
  String? message;

  TrackingModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'TrackingModel(success: $success, data: $data, message: $message)';
  }

  factory TrackingModel.fromJson(Map<String, dynamic> json) {
    return _$TrackingModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TrackingModelToJson(this);

  TrackingModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) {
    return TrackingModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
