// ignore_for_file: file_names

import 'package:chopper/chopper.dart';
import 'package:drift/drift.dart';
import 'package:position/src/core/database/db.dart';
import 'package:position/src/core/helpers/network.dart';
import 'package:position/src/core/helpers/sharedpreferences.dart';
import 'package:position/src/modules/auth/api/authApiService.dart';
import 'package:position/src/modules/auth/db/user.dao.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/auth/models/user_model/user_model.dart';
import 'package:position/src/modules/auth/models/auth_model/auth_model.dart';
import 'package:position/src/core/utils/result.dart';
import 'package:position/src/core/app/models/api_model/api_model.dart';
import 'package:position/src/modules/auth/repositories/authRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfoHelper? networkInfoHelper;
  final AuthApiService? authApiService;
  final SharedPreferencesHelper? sharedPreferencesHelper;
  final UserDao? userDao;

  AuthRepositoryImpl(
      {this.networkInfoHelper,
      this.authApiService,
      this.sharedPreferencesHelper,
      this.userDao});
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
  Future<Result<User>> getuser(String token) async {
    DateTime expireToken = await sharedPreferencesHelper!.getExpireToken();
    if (DateTime.now().compareTo(expireToken) < 0) {
      try {
        var user = await userDao!.getUser();

        return Result(success: user.user);
      } catch (e) {
        return Result(error: DbGetDataError());
      }
    } else {
      bool isConnected = await networkInfoHelper!.isConnected();
      if (isConnected) {
        try {
          final Response response = await authApiService!.getuser(token);

          var model = UserModel.fromJson(response.body);

          await userDao!.updateUser(UserTableCompanion(
              id: Value(model.data!.user!.id!), user: Value(model.data!.user)));

          return Result(success: model.data!.user);
        } catch (e) {
          return Result(error: ServerError());
        }
      } else {
        return Result(error: NoInternetError());
      }
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

        await userDao!.addUser(UserTableCompanion(
            id: Value(model.data!.user!.id!), user: Value(model.data!.user)));

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

        await userDao!.deleteUser();

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

  @override
  Future<Result<AuthModel>> registerfacebook(String token) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response = await authApiService!.registerfacebook(token);

        var model = AuthModel.fromJson(response.body);

        await userDao!.addUser(UserTableCompanion(
            id: Value(model.data!.user!.id!), user: Value(model.data!.user)));

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<AuthModel>> registergoogle(String token) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response = await authApiService!.registergoogle(token);

        var model = AuthModel.fromJson(response.body);

        await userDao!.addUser(UserTableCompanion(
            id: Value(model.data!.user!.id!), user: Value(model.data!.user)));

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }
}
