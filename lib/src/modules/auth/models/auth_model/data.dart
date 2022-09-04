import 'dart:convert';

import 'package:position/src/modules/auth/models/user_model/user.dart';

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  @override
  String toString() => 'Data(token: $token, user: $user)';

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        token: data['token'] as String?,
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'token': token,
        'user': user?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

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
