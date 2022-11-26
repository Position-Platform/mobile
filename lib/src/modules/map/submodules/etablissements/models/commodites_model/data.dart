import 'package:json_annotation/json_annotation.dart';

import 'commodite.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Commodite>? commodites;

  Data({this.commodites});

  @override
  String toString() => 'Data(commodites: $commodites)';

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    List<Commodite>? commodites,
  }) {
    return Data(
      commodites: commodites ?? this.commodites,
    );
  }
}
