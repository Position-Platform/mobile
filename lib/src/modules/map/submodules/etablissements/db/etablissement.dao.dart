import 'package:drift/drift.dart';
import 'package:position/src/core/database/db.dart';
import 'package:position/src/modules/map/submodules/etablissements/db/etablissement.table.dart';
import 'package:position/src/modules/map/submodules/etablissements/db/favorite.table.dart';

part 'etablissement.dao.g.dart';

@DriftAccessor(tables: [EtablissementTable, FavoriteTable])
class EtablissementDao extends DatabaseAccessor<MyDatabase>
    with _$EtablissementDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  EtablissementDao(MyDatabase db) : super(db);

  Future<List<EtablissementTableData>> get allEtablissements =>
      select(etablissementTable).get();

  Future<EtablissementTableData> getEtablissement(int id) {
    return (select(etablissementTable)..where((t) => t.id.equals(id)))
        .getSingle();
  }

  Future<int> addEtablissement(EtablissementTableCompanion entry) {
    return into(etablissementTable)
        .insert(entry, mode: InsertMode.insertOrReplace);
  }

  Future updateEtablissement(EtablissementTableCompanion entry) {
    return update(etablissementTable).replace(entry);
  }

  Future deleteEtablissement(int id) {
    return (delete(etablissementTable)..where((t) => t.id.equals(id))).go();
  }

  Future<int> addFavorite(FavoriteTableCompanion entry) {
    return into(favoriteTable).insert(entry, mode: InsertMode.insertOrReplace);
  }

  Future removeFavorite(FavoriteTableCompanion entry) {
    return update(favoriteTable).replace(entry);
  }

  Future<List<FavoriteTableData>> get allFavorites =>
      select(favoriteTable).get();
}
