// ignore_for_file: file_names, avoid_print

import 'package:chopper/chopper.dart';
import 'package:position/src/core/services/apiService.dart';
import 'package:position/src/modules/auth/api/authApiService.dart';

class AuthApiServiceFactory implements AuthApiService {
  final ApiService? apiService;

  AuthApiServiceFactory(this.apiService);

  @override
  Future<Response> forgotpassword(String email) async {
    Response response;

    try {
      response = await apiService!.forgetPassword({"email": email});
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> getuser(String token) async {
    Response response;
    try {
      response = await apiService!.getuser(token);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> login(String identifiant, String password) async {
    Response response;
    try {
      if (identifiant.contains('@')) {
        response = await apiService!
            .login({"email": identifiant, "password": password});
      } else {
        response = await apiService!
            .login({"phone": identifiant, "password": password});
      }
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> logout(String token) async {
    Response response;
    try {
      response = await apiService!.logout(token);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> register(
      String name, String email, String phone, String password) async {
    Response response;
    try {
      response = await apiService!.register(
          {"name": name, "email": email, "phone": phone, "password": password});
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> resetpassword(
      String email, String password, String resettoken) async {
    Response response;
    try {
      response = await apiService!.resetPassword({
        "email": email,
        "password": password,
        "password_confirmation": password,
        "token": resettoken
      });
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> registerfacebook(String token) async {
    Response response;
    try {
      response = await apiService!.registerfacebook({
        "token": token,
      });
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> registergoogle(String token) async {
    Response response;
    try {
      response = await apiService!.registergoogle({
        "token": token,
      });
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }
}
