// ignore_for_file: file_names

import 'package:position/src/core/utils/result.dart';
import 'package:position/src/modules/map/submodules/categories/models/categorie_model/categorie_model.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/categories_model.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';

abstract class CategoriesRepository {
  Future<Result<CategoriesModel>> getallcategories();

  Future<Result<CategorieModel>> getcategoriebyid(int id);

  Future<Result<CategoriesModel>> searchcategories(String query);

  Future<Result<CategorieModel>> updatecategoriebyid(int id, Category category);
}
