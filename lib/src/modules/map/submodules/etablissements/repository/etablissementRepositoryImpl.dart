// ignore_for_file: file_names

import 'package:chopper/chopper.dart';
import 'package:drift/drift.dart';
import 'package:position/src/core/database/db.dart';
import 'package:position/src/core/helpers/network.dart';
import 'package:position/src/core/helpers/sharedpreferences.dart';
import 'package:position/src/modules/auth/db/user.dao.dart';
import 'package:position/src/modules/map/submodules/etablissements/api/etablissementApiService.dart';
import 'package:position/src/modules/map/submodules/etablissements/db/etablissement.dao.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/commentaires_model/commentaires_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/datum.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/favorite_model/favorite_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/etablissements_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissement_model/etablissement_model.dart';
import 'package:position/src/core/utils/result.dart';
import 'package:position/src/core/app/models/api_model/api_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/favorites_model/favorites_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/repository/etablissementRepository.dart';

class EtablissementRepositoryImpl implements EtablissementRepository {
  final NetworkInfoHelper? networkInfoHelper;
  final EtablissementApiService? etablissementApiService;
  final SharedPreferencesHelper? sharedPreferencesHelper;
  final UserDao? userDao;
  final EtablissementDao? etablissementDao;

  EtablissementRepositoryImpl(
      {this.networkInfoHelper,
      this.etablissementApiService,
      this.sharedPreferencesHelper,
      this.userDao,
      this.etablissementDao});

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
  Future<Result<EtablissementsModel>> getalletablissements(
      String lat, String lon) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    UserTableData user = await userDao!.getUser();
    if (isConnected) {
      try {
        final Response response = await etablissementApiService!
            .getAllEtablissements(user.user!.id!, 1, lat, lon);

        var model = EtablissementsModel.fromJson(response.body);

        for (var i = 1; i <= model.data!.etablissements!.lastPage!; i++) {
          final Response response = await etablissementApiService!
              .getAllEtablissements(user.user!.id!, i, lat, lon);

          var model = EtablissementsModel.fromJson(response.body);

          for (var j = 0; j < model.data!.etablissements!.data!.length; j++) {
            try {
              await etablissementDao!.addEtablissement(
                  EtablissementTableCompanion(
                      id: Value(model.data!.etablissements!.data![j].id!),
                      etablissement:
                          Value(model.data!.etablissements!.data![j])));
            } catch (e) {
              Result(error: DbInsertError());
            }
          }
        }

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
      String? commodites,
      int? page,
      String lat,
      String lon) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response = await etablissementApiService!
            .searchEtablissementByFilter(
                idCategorie, idUser, commodites, page, lat, lon);

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
      int id, Datum etablissement) async {
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

  @override
  Future<Result<EtablissementModel>> updateetablissementview(int id) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response =
            await etablissementApiService!.updateEtablissementView(
          id,
        );

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
  Future<Result<CommentairesModel>> addreview(
      int etablissementId, String commentaire, int rating) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper!.getToken();
    if (isConnected) {
      try {
        final Response response = await etablissementApiService!
            .addReview(token!, etablissementId, commentaire, rating);

        var model = CommentairesModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<FavoritesModel>> getallfavoris() async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper!.getToken();
    if (isConnected) {
      try {
        final Response response =
            await etablissementApiService!.getFavorites(token!);

        var model = FavoritesModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }
}
