import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'etablissements_model.g.dart';

@JsonSerializable()
class EtablissementsModel {
  bool? success;
  Data? data;
  String? message;

  EtablissementsModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'EtablissementsModel(success: $success, data: $data, message: $message)';
  }

  factory EtablissementsModel.fromJson(Map<String, dynamic> json) {
    return _$EtablissementsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EtablissementsModelToJson(this);

  EtablissementsModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) {
    return EtablissementsModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
