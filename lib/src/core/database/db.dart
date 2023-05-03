import 'dart:io';

import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:position/src/modules/auth/db/user.converter.dart';
import 'package:position/src/modules/auth/db/user.dao.dart';
import 'package:position/src/modules/auth/db/user.table.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/submodules/categories/db/category.converter.dart';
import 'package:position/src/modules/map/submodules/categories/db/category.dao.dart';
import 'package:position/src/modules/map/submodules/categories/db/category.table.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';
import 'package:position/src/modules/map/submodules/etablissements/db/etablissement.converter.dart';
import 'package:position/src/modules/map/submodules/etablissements/db/etablissement.dao.dart';
import 'package:position/src/modules/map/submodules/etablissements/db/etablissement.table.dart';
import 'package:position/src/modules/map/submodules/etablissements/db/favorite.table.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/datum.dart';
import 'package:position/src/modules/map/submodules/search/db/search.dao.dart';
import 'package:position/src/modules/map/submodules/search/db/search.table.dart';

part 'db.g.dart';

@DriftDatabase(tables: [
  UserTable,
  SearchTable,
  CategoryTable,
  EtablissementTable,
  FavoriteTable
], daos: [
  UserDao,
  SearchDao,
  CategoryDao,
  EtablissementDao
])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'position.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
