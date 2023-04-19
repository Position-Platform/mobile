import 'package:drift/drift.dart';
import 'package:position/src/modules/map/submodules/categories/db/category.converter.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class CategoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get category => text().map(const CategoryConverter()).nullable()();
}
