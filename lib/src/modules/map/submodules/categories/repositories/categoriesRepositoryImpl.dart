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
      var categories = await categoryDao!.allCategories;
      if (categories.isNotEmpty) {
        List<Category>? listCategories = [];

        for (var i = 0; i < categories.length; i++) {
          listCategories.add(categories[i].category!);
        }
        return Result(success: listCategories);
      } else {
        bool isConnected = await networkInfoHelper!.isConnected();
        if (isConnected) {
          try {
            final Response response =
                await categoriesApiService!.getAllcategories();

            var model = CategoriesModel.fromJson(response.body);

            for (var i = 0; i < model.data!.categories!.length; i++) {
              try {
                await categoryDao!.addCategory(CategoryTableCompanion(
                    id: Value(model.data!.categories![i].id!),
                    category: Value(model.data!.categories![i])));
              } catch (e) {
                return Result(error: DbInsertError());
              }
            }

            return Result(success: model.data!.categories);
          } catch (e) {
            return Result(error: ServerError());
          }
        } else {
          return Result(error: NoInternetError());
        }
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
