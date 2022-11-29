import 'package:json_annotation/json_annotation.dart';

import 'etablissements.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Etablissements? etablissements;

  Data({this.etablissements});

  @override
  String toString() => 'Data(etablissements: $etablissements)';

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    Etablissements? etablissements,
  }) {
    return Data(
      etablissements: etablissements ?? this.etablissements,
    );
  }
}
