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
  Future<Response> searchcategories(@Query('q') String query);

  @Put(path: '/api/categories/{id}', headers: {'Accept': 'application/json'})
  Future<Response> updatecategoriebyid(@Header('Authorization') String token,
      @Path('id') int idCategorie, @Body() Map<String, dynamic> body);

  //Tracking
  @Post(path: '/api/tracking', headers: {'Accept': 'application/json'})
  Future<Response> addtracking(
      @Header('Authorization') String token, @Body() Map<String, dynamic> body);
}
