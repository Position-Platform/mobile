import 'package:json_annotation/json_annotation.dart';

import 'tracking.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Tracking? tracking;

  Data({this.tracking});

  @override
  String toString() => 'Data(tracking: $tracking)';

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    Tracking? tracking,
  }) {
    return Data(
      tracking: tracking ?? this.tracking,
    );
  }
}
