import 'package:drift/drift.dart';
import 'package:position/src/core/database/db.dart';
import 'package:position/src/modules/map/submodules/categories/db/category.table.dart';

part 'category.dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [CategoryTable])
class CategoryDao extends DatabaseAccessor<MyDatabase> with _$CategoryDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  CategoryDao(super.db);

  Future<List<CategoryTableData>> get allCategories =>
      select(categoryTable).get();

  Future<CategoryTableData> getCategory(int id) {
    return (select(categoryTable)..where((t) => t.id.equals(id))).getSingle();
  }

  Future<int> addCategory(CategoryTableCompanion entry) {
    return into(categoryTable).insert(entry, mode: InsertMode.insertOrReplace);
  }

  Future updateCategory(CategoryTableCompanion entry) {
    return update(categoryTable).replace(entry);
  }

  Future deleteCategory(int id) {
    return (delete(categoryTable)..where((t) => t.id.equals(id))).go();
  }
}
