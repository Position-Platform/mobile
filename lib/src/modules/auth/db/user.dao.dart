import 'package:drift/drift.dart';
import 'package:position/src/core/database/db.dart';
import 'package:position/src/modules/auth/db/user.table.dart';

part 'user.dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [UserTable])
class UserDao extends DatabaseAccessor<MyDatabase> with _$UserDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  UserDao(MyDatabase db) : super(db);

  Future<UserTableData> getUser() {
    return (select(userTable)..where((t) => t.id.equals(1))).getSingle();
  }

  Future<int> addUser(UserTableCompanion entry) {
    return into(userTable).insert(entry);
  }

  Future updateUser(UserTableCompanion entry) {
    return update(userTable).replace(entry);
  }

  Future deleteUser() {
    return (delete(userTable)..where((t) => t.id.equals(1))).go();
  }
}
