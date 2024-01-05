import 'package:drift/drift.dart';
import 'package:position/src/core/database/db.dart';
import 'package:position/src/modules/map/submodules/search/db/search.table.dart';

part 'search.dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [SearchTable])
class SearchDao extends DatabaseAccessor<MyDatabase> with _$SearchDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  SearchDao(super.db);

  Future<List<SearchTableData>> get allSuggestions => (select(searchTable)
        ..limit(5)
        ..orderBy([
          (u) => OrderingTerm(expression: u.rowId, mode: OrderingMode.desc),
          (u) => OrderingTerm(expression: u.id)
        ]))
      .get();

  Future<int> addSuggestion(SearchTableCompanion entry) {
    return into(searchTable).insert(entry, mode: InsertMode.insertOrReplace);
  }

  Future deleteSuggestion(int id) {
    return (delete(searchTable)..where((t) => t.id.equals(id))).go();
  }
}
