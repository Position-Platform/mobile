import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'commodites_model.g.dart';

@JsonSerializable()
class CommoditesModel {
  bool? success;
  Data? data;
  String? message;

  CommoditesModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'CommoditesModel(success: $success, data: $data, message: $message)';
  }

  factory CommoditesModel.fromJson(Map<String, dynamic> json) {
    return _$CommoditesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommoditesModelToJson(this);

  CommoditesModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) {
    return CommoditesModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
