// ignore_for_file: file_names, avoid_print

import 'package:chopper/chopper.dart';
import 'package:position/src/core/services/apiService.dart';
import 'package:position/src/modules/map/submodules/etablissements/api/etablissementApiService.dart';

class EtablissementApiServiceFactory implements EtablissementApiService {
  final ApiService? apiService;

  EtablissementApiServiceFactory(this.apiService);

  @override
  Future<Response> addFavoris(String token, int idEtablissement) async {
    Response response;

    try {
      response = await apiService!
          .addfavoris(token, {"etablissement_id": idEtablissement});
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> deleteEtablissementById(String token, int id) async {
    Response response;

    try {
      response = await apiService!.deleteetablissementbyid(token, id);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> getAllEtablissements(
      int idUser, int page, String lat, String lon) async {
    Response response;

    try {
      response = await apiService!.getetablissements(idUser, page, lat, lon);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> getEtablissementById(int id, int idUser) async {
    Response response;

    try {
      response = await apiService!.getetablissementbyid(id, idUser);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> removeFavoris(String token, int idEtablissement) async {
    Response response;

    try {
      response = await apiService!
          .removefavoris(token, {"etablissement_id": idEtablissement});
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> searchEtablissement(String query, int idUser) async {
    Response response;

    try {
      response = await apiService!.searchetablissements(query, idUser);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> searchEtablissementByFilter(int idCategorie, int idUser,
      String? commodites, int? page, String lat, String lon) async {
    Response response;

    try {
      response = await apiService!.searchetablissementsbyfilters(
          idCategorie, idUser, commodites, page, lat, lon);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> updateEtablissementById(
      String token, int id, Map<String, dynamic> body) async {
    Response response;

    try {
      response = await apiService!.updateetablissementbyid(token, id, body);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> updateEtablissementView(int id) async {
    Response response;

    try {
      response = await apiService!.updateetablissementview(id);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> addReview(
      String token, int etablissementId, String commentaire, int rating) async {
    Response response;

    try {
      response = await apiService!.addreview(token, {
        "etablissement_id": etablissementId,
        "commentaire": commentaire,
        "rating": rating
      });
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> getFavorites(String token) async {
    Response response;

    try {
      response = await apiService!.getfavoris(token);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }
}
