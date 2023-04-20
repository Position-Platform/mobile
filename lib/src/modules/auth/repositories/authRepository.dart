// ignore_for_file: file_names

import 'package:position/src/core/app/models/api_model/api_model.dart';
import 'package:position/src/core/utils/result.dart';
import 'package:position/src/modules/auth/models/auth_model/auth_model.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';

abstract class AuthRepository {
  Future<Result<AuthModel>> login(
    String indentifiant,
    String password,
  );

  Future<Result<AuthModel>> register(
      String name, String email, String phone, String password);

  Future<Result<AuthModel>> registerfacebook(String token);

  Future<Result<AuthModel>> registergoogle(String token);

  Future<Result<User>> getuser(String token);

  Future<Result<ApiModel>> forgotpassword(String email);

  Future<Result<ApiModel>> resetpassword(
      String email, String password, String resettoken);

  Future<bool> deletetoken();

  Future<bool> savetoken(String token);

  Future<bool> hastoken();

  Future<Result<ApiModel>> logout(String token);
}
