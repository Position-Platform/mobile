import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';

class UserConverter extends TypeConverter<User, String> {
  const UserConverter();

  @override
  User fromSql(String fromDb) {
    return User.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(User value) {
    return json.encode(value.toJson());
  }
}
