import 'package:json_annotation/json_annotation.dart';

import 'etablissement.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Etablissement>? etablissements;

  Data({this.etablissements});

  @override
  String toString() => 'Data(etablissements: $etablissements)';

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    List<Etablissement>? etablissements,
  }) {
    return Data(
      etablissements: etablissements ?? this.etablissements,
    );
  }
}
