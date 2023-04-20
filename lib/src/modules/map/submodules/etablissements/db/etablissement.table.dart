import 'package:drift/drift.dart';
import 'package:position/src/modules/map/submodules/etablissements/db/etablissement.converter.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class EtablissementTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get etablissement =>
      text().map(const EtablissementConverter()).nullable()();
}
