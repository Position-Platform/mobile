import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'categorie_model.g.dart';

@JsonSerializable()
class CategorieModel {
  bool? success;
  Data? data;
  String? message;

  CategorieModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'CategorieModel(success: $success, data: $data, message: $message)';
  }

  factory CategorieModel.fromJson(Map<String, dynamic> json) {
    return _$CategorieModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategorieModelToJson(this);

  CategorieModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) {
    return CategorieModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
