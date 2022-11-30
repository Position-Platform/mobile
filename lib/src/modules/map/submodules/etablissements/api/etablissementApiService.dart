// ignore_for_file: file_names

import 'package:chopper/chopper.dart';

abstract class EtablissementApiService {
  Future<Response> getAllEtablissements();

  Future<Response> getEtablissementById(int id, int idUser);

  Future<Response> searchEtablissement(String query, int idUser);

  Future<Response> updateEtablissementById(
      String token, int id, Map<String, dynamic> body);

  Future<Response> updateEtablissementView(int id);

  Future<Response> deleteEtablissementById(String token, int id);

  Future<Response> addFavoris(String token, int idEtablissement);

  Future<Response> removeFavoris(String token, int idEtablissement);

  Future<Response> searchEtablissementByFilter(
      int idCategorie, int idUser, String? idCommodites, int? page);

  Future<Response> getAllCommodites();

  Future<Response> getAllTypeCommodites();

  Future<Response> addReview(
      String token, int etablissementId, String commentaire, int rating);

  Future<Response> getFavorites(String token);
}
