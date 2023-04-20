import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/datum.dart';

class EtablissementConverter extends TypeConverter<Datum, String> {
  const EtablissementConverter();

  @override
  Datum fromSql(String fromDb) {
    return Datum.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Datum value) {
    return json.encode(value.toJson());
  }
}
