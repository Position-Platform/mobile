// ignore_for_file: file_names

import 'package:chopper/chopper.dart';

abstract class AuthApiService {
  Future<Response> login(
    String identifiant,
    String password,
  );

  Future<Response> register(
      String name, String email, String phone, String password);

  Future<Response> registerfacebook(String token);

  Future<Response> registergoogle(String token);

  Future<Response> getuser(String token);

  Future<Response> forgotpassword(String email);

  Future<Response> resetpassword(
      String email, String password, String resettoken);

  Future<Response> logout(String token);
}
