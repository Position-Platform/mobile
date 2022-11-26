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
  Future<Response> getAllEtablissements() async {
    Response response;

    try {
      response = await apiService!.getetablissements();
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
  Future<Response> searchEtablissementByFilter(
      int idCategorie, int idUser, String? idCommodites) async {
    Response response;

    try {
      response = await apiService!.searchetablissementsbyfilters(
        idCategorie,
        idCommodites,
        idUser,
      );
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
  Future<Response> getAllCommodites() async {
    Response response;

    try {
      response = await apiService!.getcommodites();
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> getAllTypeCommodites() async {
    Response response;

    try {
      response = await apiService!.gettypecommodites();
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }
}
