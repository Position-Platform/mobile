import 'dart:convert';

import 'user.dart';

class Data {
  User? user;

  Data({this.user});

  @override
  String toString() => 'Data(user: $user)';

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
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
    User? user,
  }) {
    return Data(
      user: user ?? this.user,
    );
  }
}
