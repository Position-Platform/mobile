import 'package:json_annotation/json_annotation.dart';

import 'favorite.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Favorite? favorite;

  Data({this.favorite});

  @override
  String toString() => 'Data(favorite: $favorite)';

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    Favorite? favorite,
  }) {
    return Data(
      favorite: favorite ?? this.favorite,
    );
  }
}
