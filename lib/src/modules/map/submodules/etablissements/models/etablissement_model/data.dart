import 'package:json_annotation/json_annotation.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/datum.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Datum? etablissement;

  Data({this.etablissement});

  @override
  String toString() => 'Data(etablissement: $etablissement)';

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    Datum? etablissement,
  }) {
    return Data(
      etablissement: etablissement ?? this.etablissement,
    );
  }
}
