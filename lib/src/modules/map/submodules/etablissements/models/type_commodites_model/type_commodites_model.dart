import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'type_commodites_model.g.dart';

@JsonSerializable()
class TypeCommoditesModel {
  bool? success;
  Data? data;
  String? message;

  TypeCommoditesModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'TypeCommoditesModel(success: $success, data: $data, message: $message)';
  }

  factory TypeCommoditesModel.fromJson(Map<String, dynamic> json) {
    return _$TypeCommoditesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TypeCommoditesModelToJson(this);

  TypeCommoditesModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) {
    return TypeCommoditesModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
