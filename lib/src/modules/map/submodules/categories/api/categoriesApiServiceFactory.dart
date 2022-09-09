// ignore_for_file: file_names, avoid_print

import 'package:chopper/chopper.dart';
import 'package:position/src/core/services/apiService.dart';
import 'package:position/src/modules/map/submodules/categories/api/categoriesApiService.dart';

class CategoriesApiServiceFactory implements CategoriesApiService {
  final ApiService? apiService;

  CategoriesApiServiceFactory(this.apiService);

  @override
  Future<Response> getAllcategories() async {
    Response response;

    try {
      response = await apiService!.getcategories();
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> getCategorieById(int id) async {
    Response response;

    try {
      response = await apiService!.getcategoriesbyid(id);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> searchCategories(String query) async {
    Response response;

    try {
      response = await apiService!.searchcategories(query);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> updateCategorieById(
      String token, int id, Map<String, dynamic> body) async {
    Response response;

    try {
      response = await apiService!.updatecategoriebyid(token, id, body);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }
}
