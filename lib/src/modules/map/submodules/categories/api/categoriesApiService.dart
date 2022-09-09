// ignore_for_file: file_names

import 'package:chopper/chopper.dart';

abstract class CategoriesApiService {
  Future<Response> getAllcategories();

  Future<Response> getCategorieById(int id);

  Future<Response> searchCategories(String query);

  Future<Response> updateCategorieById(
      String token, int id, Map<String, dynamic> body);
}
