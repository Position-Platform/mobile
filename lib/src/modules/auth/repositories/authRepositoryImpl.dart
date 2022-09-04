// ignore_for_file: file_names

import 'package:chopper/chopper.dart';
import 'package:position/src/core/helpers/network.dart';
import 'package:position/src/core/helpers/sharedpreferences.dart';
import 'package:position/src/modules/auth/api/authApiService.dart';
import 'package:position/src/modules/auth/models/user_model/user_model.dart';
import 'package:position/src/modules/auth/models/auth_model/auth_model.dart';
import 'package:position/src/core/utils/result.dart';
import 'package:position/src/core/app/models/api_model.dart';
import 'package:position/src/modules/auth/repositories/authRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfoHelper? networkInfoHelper;
  final AuthApiService? authApiService;
  final SharedPreferencesHelper? sharedPreferencesHelper;

  AuthRepositoryImpl(
      {this.networkInfoHelper,
      this.authApiService,
      this.sharedPreferencesHelper});
  @override
  Future<bool> deletetoken() async {
    bool delete = await sharedPreferencesHelper!.deleteToken();
    return delete;
  }

  @override
  Future<Result<ApiModel>> forgotpassword(String email) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response = await authApiService!.forgotpassword(email);

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
  Future<Result<UserModel>> getuser(String token) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response = await authApiService!.getuser(token);

        var model = UserModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<bool> hastoken() async {
    bool hasToken;
    String? token = await sharedPreferencesHelper!.getToken();
    if (token != null) {
      hasToken = true;
    } else {
      hasToken = false;
    }

    return hasToken;
  }

  @override
  Future<Result<AuthModel>> login(
    String indentifiant,
    String password,
  ) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response =
            await authApiService!.login(indentifiant, password);

        var model = AuthModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<ApiModel>> logout(String token) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response = await authApiService!.logout(token);

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
  Future<Result<AuthModel>> register(
      String name, String email, String phone, String password) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response =
            await authApiService!.register(name, email, phone, password);

        var model = AuthModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<ApiModel>> resetpassword(
      String email, String password, String resettoken) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response =
            await authApiService!.resetpassword(email, password, resettoken);

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
  Future<bool> savetoken(String token) async {
    bool saveT = await sharedPreferencesHelper!.setToken(token);
    return saveT;
  }
}
