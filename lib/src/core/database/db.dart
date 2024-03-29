import 'dart:io';

import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:position/src/modules/auth/db/user.converter.dart';
import 'package:position/src/modules/auth/db/user.dao.dart';
import 'package:position/src/modules/auth/db/user.table.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';
import 'package:position/src/modules/map/submodules/categories/db/category.converter.dart';
import 'package:position/src/modules/map/submodules/categories/db/category.dao.dart';
import 'package:position/src/modules/map/submodules/categories/db/category.table.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';
import 'package:position/src/modules/map/submodules/etablissements/db/etablissement.converter.dart';
import 'package:position/src/modules/map/submodules/etablissements/db/etablissement.dao.dart';
import 'package:position/src/modules/map/submodules/etablissements/db/etablissement.table.dart';
import 'package:position/src/modules/map/submodules/etablissements/db/favorite.table.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/datum.dart';
import 'package:position/src/modules/map/submodules/search/db/search.converter.dart';
import 'package:position/src/modules/map/submodules/search/db/search.dao.dart';
import 'package:position/src/modules/map/submodules/search/db/search.table.dart';

part 'db.g.dart';

// Annotation pour indiquer que cette classe est une base de données Drift
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
  // Constructeur pour spécifier l'emplacement de la base de données
  MyDatabase() : super(_openConnection());

  // Numéro de version du schéma de la base de données
  @override
  int get schemaVersion => 1;
}

// Fonction pour ouvrir une connexion à la base de données
LazyDatabase _openConnection() {
  // Utilisation de LazyDatabase pour trouver l'emplacement du fichier de base de données de manière asynchrone
  return LazyDatabase(() async {
    // Création du fichier de base de données dans le dossier des documents de l'application
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'position.sqlite'));
    // Création de la base de données native
    return NativeDatabase.createInBackground(file);
  });
}
