import 'package:drift/drift.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class SearchTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get suggestion => text()();
}
