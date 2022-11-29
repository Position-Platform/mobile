// ignore_for_file: file_names

import 'package:chopper/chopper.dart';
import 'package:position/src/core/utils/configs.dart';

part 'apiService.chopper.dart';

@ChopperApi(baseUrl: apiUrl)
abstract class ApiService extends ChopperService {
  static ApiService create([ChopperClient? client]) => _$ApiService(client);

  // User Api
  @Post(path: '/api/auth/login', headers: {'Accept': 'application/json'})
  Future<Response> login(@Body() Map<String, dynamic> body);

  @Post(path: '/api/auth/register', headers: {'Accept': 'application/json'})
  Future<Response> register(@Body() Map<String, dynamic> body);

  @Post(
      path: '/api/auth/register/facebook',
      headers: {'Accept': 'application/json'})
  Future<Response> registerfacebook(@Body() Map<String, dynamic> body);

  @Post(
      path: '/api/auth/register/google',
      headers: {'Accept': 'application/json'})
  Future<Response> registergoogle(@Body() Map<String, dynamic> body);

  @Get(path: '/api/user/me', headers: {'Accept': 'application/json'})
  Future<Response> getuser(
    @Header('Authorization') String token,
  );

  @Post(
      path: '/api/auth/password/forgot',
      headers: {'Accept': 'application/json'})
  Future<Response> forgetPassword(@Body() Map<String, dynamic> body);

  @Post(
      path: '/api/auth/password/reset', headers: {'Accept': 'application/json'})
  Future<Response> resetPassword(@Body() Map<String, dynamic> body);

  @Get(path: '/api/auth/logout', headers: {'Accept': 'application/json'})
  Future<Response> logout(
    @Header('Authorization') String token,
  );

// Categories
  @Get(path: '/api/categories', headers: {'Accept': 'application/json'})
  Future<Response> getcategories();

  @Get(path: '/api/categories/{id}', headers: {'Accept': 'application/json'})
  Future<Response> getcategoriesbyid(@Path('id') int idCategorie);

  @Get(path: '/api/search/categories', headers: {'Accept': 'application/json'})
  Future<Response> searchcategories(
    @Query('q') String query,
  );

  @Put(path: '/api/categories/{id}', headers: {'Accept': 'application/json'})
  Future<Response> updatecategoriebyid(@Header('Authorization') String token,
      @Path('id') int idCategorie, @Body() Map<String, dynamic> body);

  //Tracking
  @Post(path: '/api/tracking', headers: {'Accept': 'application/json'})
  Future<Response> addtracking(
      @Header('Authorization') String token, @Body() Map<String, dynamic> body);

  //Etablissements
  @Get(path: '/api/etablissements', headers: {'Accept': 'application/json'})
  Future<Response> getetablissements();

  @Get(
      path: '/api/etablissements/{id}', headers: {'Accept': 'application/json'})
  Future<Response> getetablissementbyid(
      @Path('id') int idEtablissement, @Query('user_id') int idUser);

  @Get(
      path: '/api/search/etablissements',
      headers: {'Accept': 'application/json'})
  Future<Response> searchetablissements(
      @Query('q') String query, @Query('user_id') int idUser);

  @Put(
      path: '/api/etablissements/{id}', headers: {'Accept': 'application/json'})
  Future<Response> updateetablissementbyid(
      @Header('Authorization') String token,
      @Path('id') int idEtablissement,
      @Body() Map<String, dynamic> body);

  @Delete(
      path: '/api/etablissements/{id}', headers: {'Accept': 'application/json'})
  Future<Response> deleteetablissementbyid(
      @Header('Authorization') String token, @Path('id') int idEtablissement);

  @Post(path: '/api/favoris/add', headers: {'Accept': 'application/json'})
  Future<Response> addfavoris(
      @Header('Authorization') String token, @Body() Map<String, dynamic> body);

  @Post(path: '/api/favoris/remove', headers: {'Accept': 'application/json'})
  Future<Response> removefavoris(
      @Header('Authorization') String token, @Body() Map<String, dynamic> body);

  @Get(
      path: '/api/search/etablissements/filter',
      headers: {'Accept': 'application/json'})
  Future<Response> searchetablissementsbyfilters(
      @Query('id_categorie') int idCategorie,
      @Query('idCommodites') String? idCommodites,
      @Query('user_id') int idUser,
      @Query('page') int? page);

  @Put(
      path: '/api/etablissements/vues/{etablissement_id}',
      headers: {'Accept': 'application/json'})
  Future<Response> updateetablissementview(
      @Path('etablissement_id') int idEtablissement);

  //Commodites
  @Get(path: '/api/commodites', headers: {'Accept': 'application/json'})
  Future<Response> getcommodites();

  @Get(path: '/api/typecommodites', headers: {'Accept': 'application/json'})
  Future<Response> gettypecommodites();
}
