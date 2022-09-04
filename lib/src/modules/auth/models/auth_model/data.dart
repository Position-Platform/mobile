import 'package:json_annotation/json_annotation.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  @override
  String toString() => 'Data(token: $token, user: $user)';

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    String? token,
    User? user,
  }) {
    return Data(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }
}
