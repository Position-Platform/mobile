import 'package:drift/drift.dart';
import 'package:position/src/modules/auth/db/user.converter.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class UserTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get user => text().map(const UserConverter()).nullable()();
}
