// ignore_for_file: file_names

import 'package:chopper/chopper.dart';
import 'package:position/src/core/helpers/network.dart';
import 'package:position/src/core/helpers/sharedpreferences.dart';
import 'package:position/src/modules/map/submodules/etablissements/api/etablissementApiService.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/favorite_model/favorite_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/etablissements_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/etablissement.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissement_model/etablissement_model.dart';
import 'package:position/src/core/utils/result.dart';
import 'package:position/src/core/app/models/api_model/api_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/repository/etablissementRepository.dart';

class EtablissementRepositoryImpl implements EtablissementRepository {
  final NetworkInfoHelper? networkInfoHelper;
  final EtablissementApiService? etablissementApiService;
  final SharedPreferencesHelper? sharedPreferencesHelper;

  EtablissementRepositoryImpl(
      {this.networkInfoHelper,
      this.etablissementApiService,
      this.sharedPreferencesHelper});

  @override
  Future<Result<FavoriteModel>> addfavorite(int idEtablissement) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper!.getToken();
    if (isConnected) {
      try {
        final Response response =
            await etablissementApiService!.addFavoris(token!, idEtablissement);

        var model = FavoriteModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<ApiModel>> deleteetablissementbyid(int id) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper!.getToken();
    if (isConnected) {
      try {
        final Response response =
            await etablissementApiService!.deleteEtablissementById(token!, id);

        var model = ApiModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<EtablissementsModel>> getalletablissements() async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response =
            await etablissementApiService!.getAllEtablissements();

        var model = EtablissementsModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<EtablissementModel>> getetablissementbyid(
      int id, int idUser) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response =
            await etablissementApiService!.getEtablissementById(id, idUser);

        var model = EtablissementModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<FavoriteModel>> removefavorite(int idEtablissement) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper!.getToken();
    if (isConnected) {
      try {
        final Response response = await etablissementApiService!
            .removeFavoris(token!, idEtablissement);

        var model = FavoriteModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<EtablissementsModel>> searchetablissements(
      String query, int idUser) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response =
            await etablissementApiService!.searchEtablissement(query, idUser);

        var model = EtablissementsModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<EtablissementsModel>> searchetablissementsbyfilters(
    int idCategorie,
    int idUser,
    String? idCommodites,
  ) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response = await etablissementApiService!
            .searchEtablissementByFilter(idCategorie, idUser, idCommodites);

        var model = EtablissementsModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<EtablissementModel>> updateetablissementbyid(
      int id, Etablissement etablissement) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper!.getToken();
    if (isConnected) {
      try {
        var etablissementjson = etablissement.toJson();
        etablissementjson.remove("cover");
        etablissementjson.remove("logo");
        final Response response = await etablissementApiService!
            .updateEtablissementById(token!, id, etablissementjson);

        var model = EtablissementModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }
}