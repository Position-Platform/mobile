import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';

// La classe UserConverter est utilisée pour convertir un objet User en une chaîne JSON et vice versa.
class UserConverter extends TypeConverter<User, String> {
  const UserConverter();

  // La méthode fromSql est appelée lorsqu'un objet User est récupéré de la base de données.
  // Elle convertit la représentation JSON de l'objet en une instance de User.
  @override
  User fromSql(String fromDb) {
    return User.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  // La méthode toSql est appelée lorsqu'un objet User est inséré dans la base de données.
  // Elle convertit l'objet User en une chaîne JSON qui peut être stockée dans la base de données.
  @override
  String toSql(User value) {
    return json.encode(value.toJson());
  }
}
