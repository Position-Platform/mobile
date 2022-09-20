import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'favorite_model.g.dart';

@JsonSerializable()
class FavoriteModel {
  bool? success;
  Data? data;
  String? message;

  FavoriteModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'FavoriteModel(success: $success, data: $data, message: $message)';
  }

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return _$FavoriteModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FavoriteModelToJson(this);

  FavoriteModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) {
    return FavoriteModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
