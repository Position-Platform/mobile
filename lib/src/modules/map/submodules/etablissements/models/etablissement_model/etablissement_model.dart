import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'etablissement_model.g.dart';

@JsonSerializable()
class EtablissementModel {
  bool? success;
  Data? data;
  String? message;

  EtablissementModel({this.success, this.data, this.message});

  @override
  String toString() {
    return 'EtablissementModel(success: $success, data: $data, message: $message)';
  }

  factory EtablissementModel.fromJson(Map<String, dynamic> json) {
    return _$EtablissementModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EtablissementModelToJson(this);

  EtablissementModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) {
    return EtablissementModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
