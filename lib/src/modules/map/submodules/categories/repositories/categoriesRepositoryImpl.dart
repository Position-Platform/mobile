// ignore_for_file: file_names

import 'package:chopper/chopper.dart';
import 'package:drift/drift.dart';
import 'package:position/src/core/database/db.dart';
import 'package:position/src/core/helpers/network.dart';
import 'package:position/src/core/helpers/sharedpreferences.dart';
import 'package:position/src/core/utils/result.dart';
import 'package:position/src/modules/map/submodules/categories/api/categoriesApiService.dart';
import 'package:position/src/modules/map/submodules/categories/db/category.dao.dart';
import 'package:position/src/modules/map/submodules/categories/models/categorie_model/categorie_model.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/categories_model.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';
import 'package:position/src/modules/map/submodules/categories/repositories/categoriesRepository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final NetworkInfoHelper? networkInfoHelper;
  final CategoriesApiService? categoriesApiService;
  final SharedPreferencesHelper? sharedPreferencesHelper;
  final CategoryDao? categoryDao;

  CategoriesRepositoryImpl(
      {this.networkInfoHelper,
      this.categoriesApiService,
      this.sharedPreferencesHelper,
      this.categoryDao});

  @override
  Future<Result<List<Category>>> getallcategories() async {
    try {
      var localCategories = await categoryDao!.allCategories;

      if (localCategories.isNotEmpty) {
        return Result(
            success:
                localCategories.map((category) => category.category!).toList());
      }

      bool isConnected = await networkInfoHelper!.isConnected();
      if (isConnected) {
        try {
          final Response response =
              await categoriesApiService!.getAllcategories();
          var model = CategoriesModel.fromJson(response.body);

          await Future.wait(model.data!.categories!.map((onlineCategory) async {
            try {
              await categoryDao!.addCategory(CategoryTableCompanion(
                  id: Value(onlineCategory.id!),
                  category: Value(onlineCategory)));
            } catch (e) {
              return Result(error: DbInsertError());
            }
          }));

          return Result(success: model.data!.categories);
        } catch (e) {
          return Result(error: ServerError());
        }
      } else {
        return Result(error: NoInternetError());
      }
    } catch (e) {
      return Result(error: DbGetDataError());
    }
  }

  @override
  Future<Result<Category>> getcategoriebyid(int id) async {
    try {
      var categorie = await categoryDao!.getCategory(id);

      return Result(success: categorie.category!);
    } catch (e) {
      return Result(error: DbGetDataError());
    }
  }

  @override
  Future<Result<List<Category>>> searchcategories(String query) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response =
            await categoriesApiService!.searchCategories(query);

        var model = CategoriesModel.fromJson(response.body);

        return Result(success: model.data!.categories);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<Category>> updatecategoriebyid(
      int id, Category category) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper!.getToken();
    if (isConnected) {
      try {
        var categoryjson = category.toJson();
        categoryjson.remove("logourl");
        categoryjson.remove("logourlmap");
        final Response response = await categoriesApiService!
            .updateCategorieById(token!, id, categoryjson);

        var model = CategorieModel.fromJson(response.body);

        try {
          await categoryDao!.updateCategory(CategoryTableCompanion(
              id: Value(model.data!.categorie!.id!),
              category: Value(model.data!.categorie!)));
        } catch (e) {
          Result(error: DbUpdateError());
        }

        return Result(success: model.data!.categorie);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }
}
