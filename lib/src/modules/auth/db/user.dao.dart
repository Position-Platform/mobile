import 'package:drift/drift.dart';
import 'package:position/src/core/database/db.dart';
import 'package:position/src/modules/auth/db/user.table.dart';

part 'user.dao.g.dart';

// La classe UserDao est utilisée pour interagir avec la table userTable dans une base de données en utilisant la bibliothèque drift.
// Elle étend la classe DatabaseAccessor de drift, qui fournit une manière pratique d'accéder à la base de données et d'effectuer des opérations CRUD (Create, Read, Update, Delete) sur la table.
// La classe UserDao est annotée avec @DriftAccessor, qui spécifie qu'elle est associée à la table UserTable.
// Cette annotation génère une classe mixin appelée _UserDaoMixin qui contient tous les champs et méthodes nécessaires pour interagir avec la table.
@DriftAccessor(tables: [UserTable])
class UserDao extends DatabaseAccessor<MyDatabase> with _$UserDaoMixin {
  // Ce constructeur est requis pour que la base de données principale puisse créer une instance de cet objet.
  UserDao(super.db);

  // La méthode getUser récupère une seule ligne de la table où la colonne id est égale à 1.
  Future<UserTableData> getUser() {
    return (select(userTable)..where((t) => t.id.equals(1))).getSingle();
  }

  // La méthode addUser insère une nouvelle ligne dans la table en utilisant l'objet UserTableCompanion passé en argument.
  Future<int> addUser(UserTableCompanion entry) {
    return into(userTable).insert(entry);
  }

  // La méthode updateUser met à jour une ligne existante dans la table en utilisant l'objet UserTableCompanion passé en argument.
  Future updateUser(UserTableCompanion entry) {
    return update(userTable).replace(entry);
  }

  // La méthode deleteUser supprime une ligne de la table où la colonne id est égale à 1.
  Future deleteUser() {
    return (delete(userTable)..where((t) => t.id.equals(1))).go();
  }
}
