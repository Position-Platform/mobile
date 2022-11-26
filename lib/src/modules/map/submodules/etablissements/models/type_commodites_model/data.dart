import 'package:json_annotation/json_annotation.dart';

import 'types_commodite.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'types_commodites')
  List<TypesCommodite>? typesCommodites;

  Data({this.typesCommodites});

  @override
  String toString() => 'Data(typesCommodites: $typesCommodites)';

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    List<TypesCommodite>? typesCommodites,
  }) {
    return Data(
      typesCommodites: typesCommodites ?? this.typesCommodites,
    );
  }
}
