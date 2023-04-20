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
  SearchDao(MyDatabase db) : super(db);

  Future<List<SearchTableData>> get allSuggestions => select(searchTable).get();

  Future<int> addSuggestion(SearchTableCompanion entry) {
    return into(searchTable).insert(entry);
  }

  Future deleteSuggestion(int id) {
    return (delete(searchTable)..where((t) => t.id.equals(id))).go();
  }
}
