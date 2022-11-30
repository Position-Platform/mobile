import 'package:json_annotation/json_annotation.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/datum.dart';

part 'favorites_model.g.dart';

@JsonSerializable()
class FavoritesModel {
  bool? success;
  List<Datum>? data;
  String? message;

  FavoritesModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'FavoritesModel(success: $success, data: $data, message: $message)';
  }

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return _$FavoritesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FavoritesModelToJson(this);

  FavoritesModel copyWith({
    bool? success,
    List<Datum>? data,
    String? message,
  }) {
    return FavoritesModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
