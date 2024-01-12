import 'package:drift/drift.dart';
import 'package:position/src/modules/auth/db/user.converter.dart';

// La classe UserTable représente une table dans une base de données en utilisant la bibliothèque drift.
// Cette classe étend la classe Table de drift, qui fournit une manière pratique de définir les colonnes et les contraintes de la table.
class UserTable extends Table {
  // La méthode get id définit une colonne entière auto-incrémentée qui sert de clé primaire pour la table.
  IntColumn get id => integer().autoIncrement()();

  // La méthode get user définit une colonne de texte qui stocke une représentation JSON d'un objet User.
  // La méthode map est utilisée pour spécifier que le convertisseur UserConverter doit être utilisé pour convertir entre l'objet User et la représentation JSON.
  TextColumn get user => text().map(const UserConverter()).nullable()();
}
