import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  User? user;

  Data({this.user});

  @override
  String toString() => 'Data(user: $user)';

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    User? user,
  }) {
    return Data(
      user: user ?? this.user,
    );
  }
}
