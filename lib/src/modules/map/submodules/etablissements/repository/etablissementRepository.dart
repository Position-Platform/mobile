// ignore_for_file: file_names

import 'package:position/src/core/app/models/api_model/api_model.dart';
import 'package:position/src/core/utils/result.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/commentaires_model/commentaires_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissement_model/etablissement_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/datum.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/etablissements_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/favorite_model/favorite_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/favorites_model/favorites_model.dart';

abstract class EtablissementRepository {
  Future<Result<EtablissementsModel>> getalletablissements();

  Future<Result<EtablissementModel>> getetablissementbyid(int id, int idUser);

  Future<Result<EtablissementsModel>> searchetablissements(
      String query, int idUser);

  Future<Result<EtablissementModel>> updateetablissementbyid(
      int id, Datum etablissement);

  Future<Result<EtablissementModel>> updateetablissementview(int id);

  Future<Result<ApiModel>> deleteetablissementbyid(int id);

  Future<Result<FavoriteModel>> addfavorite(int idEtablissement);

  Future<Result<FavoriteModel>> removefavorite(int idEtablissement);

  Future<Result<EtablissementsModel>> searchetablissementsbyfilters(
      int idCategorie, int idUser, String commodites, int? page);

  Future<Result<CommentairesModel>> addreview(
      int etablissementId, String commentaire, int rating);

  Future<Result<FavoritesModel>> getallfavoris();
}
