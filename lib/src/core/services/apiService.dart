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
}
