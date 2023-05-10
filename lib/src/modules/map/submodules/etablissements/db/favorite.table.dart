import 'package:drift/drift.dart';
import 'package:position/src/modules/map/submodules/etablissements/db/etablissement.converter.dart';

class FavoriteTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get etablissement =>
      text().map(const EtablissementConverter()).nullable()();

  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
}
