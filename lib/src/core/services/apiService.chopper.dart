// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiService;

  @override
  Future<Response<dynamic>> login(Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/auth/login';
    final $headers = {
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> register(Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/auth/register';
    final $headers = {
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> registerfacebook(Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/auth/register/facebook';
    final $headers = {
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> registergoogle(Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/auth/register/google';
    final $headers = {
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getuser(String token) {
    final $url = 'https://services.position.cm/api/user/me';
    final $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> forgetPassword(Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/auth/password/forgot';
    final $headers = {
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> resetPassword(Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/auth/password/reset';
    final $headers = {
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> logout(String token) {
    final $url = 'https://services.position.cm/api/auth/logout';
    final $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getcategories() {
    final $url = 'https://services.position.cm/api/categories';
    final $headers = {
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getcategoriesbyid(int idCategorie) {
    final $url = 'https://services.position.cm/api/categories/${idCategorie}';
    final $headers = {
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> searchcategories(String query) {
    final $url = 'https://services.position.cm/api/search/categories';
    final $params = <String, dynamic>{'q': query};
    final $headers = {
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updatecategoriebyid(
      String token, int idCategorie, Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/categories/${idCategorie}';
    final $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addtracking(
      String token, Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/tracking';
    final $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getetablissements() {
    final $url = 'https://services.position.cm/api/etablissements';
    final $headers = {
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getetablissementbyid(
      int idEtablissement, int idUser) {
    final $url =
        'https://services.position.cm/api/etablissements/${idEtablissement}';
    final $params = <String, dynamic>{'user_id': idUser};
    final $headers = {
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> searchetablissements(String query, int idUser) {
    final $url = 'https://services.position.cm/api/search/etablissements';
    final $params = <String, dynamic>{'q': query, 'user_id': idUser};
    final $headers = {
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateetablissementbyid(
      String token, int idEtablissement, Map<String, dynamic> body) {
    final $url =
        'https://services.position.cm/api/etablissements/${idEtablissement}';
    final $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteetablissementbyid(
      String token, int idEtablissement) {
    final $url =
        'https://services.position.cm/api/etablissements/${idEtablissement}';
    final $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addfavoris(
      String token, Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/favoris/add';
    final $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> removefavoris(
      String token, Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/favoris/remove';
    final $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getfavoris(String token) {
    final $url = 'https://services.position.cm/api/favoris';
    final $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> searchetablissementsbyfilters(
      int idCategorie, String? idCommodites, int idUser, int? page) {
    final $url =
        'https://services.position.cm/api/search/etablissements/filter';
    final $params = <String, dynamic>{
      'id_categorie': idCategorie,
      'idCommodites': idCommodites,
      'user_id': idUser,
      'page': page
    };
    final $headers = {
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateetablissementview(int idEtablissement) {
    final $url =
        'https://services.position.cm/api/etablissements/vues/${idEtablissement}';
    final $headers = {
      'Accept': 'application/json',
    };

    final $request = Request('PUT', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getcommodites() {
    final $url = 'https://services.position.cm/api/commodites';
    final $headers = {
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> gettypecommodites() {
    final $url = 'https://services.position.cm/api/typecommodites';
    final $headers = {
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addreview(String token, Map<String, dynamic> body) {
    final $url = 'https://services.position.cm/api/commentaires';
    final $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
