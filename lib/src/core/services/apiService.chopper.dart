// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_string_interpolations, unnecessary_brace_in_string_interps
class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiService;

  @override
  Future<Response<dynamic>> login(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('${apiUrl}/api/auth/login');
    final Map<String, String> $headers = {
      'Accept': 'application/json',
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> register(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('${apiUrl}/api/auth/register');
    final Map<String, String> $headers = {
      'Accept': 'application/json',
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> registerfacebook(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('${apiUrl}/api/auth/register/facebook');
    final Map<String, String> $headers = {
      'Accept': 'application/json',
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> registergoogle(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('${apiUrl}/api/auth/register/google');
    final Map<String, String> $headers = {
      'Accept': 'application/json',
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getuser(String token) {
    final Uri $url = Uri.parse('${apiUrl}/api/user/me');
    final Map<String, String> $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> forgetPassword(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('${apiUrl}/api/auth/password/forgot');
    final Map<String, String> $headers = {
      'Accept': 'application/json',
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> resetPassword(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('${apiUrl}/api/auth/password/reset');
    final Map<String, String> $headers = {
      'Accept': 'application/json',
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> logout(String token) {
    final Uri $url = Uri.parse('${apiUrl}/api/auth/logout');
    final Map<String, String> $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getcategories() {
    final Uri $url = Uri.parse('${apiUrl}/api/categories');
    final Map<String, String> $headers = {
      'Accept': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getcategoriesbyid(int idCategorie) {
    final Uri $url = Uri.parse('${apiUrl}/api/categories/${idCategorie}');
    final Map<String, String> $headers = {
      'Accept': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> searchcategories(String query) {
    final Uri $url = Uri.parse('${apiUrl}/api/search/categories');
    final Map<String, dynamic> $params = <String, dynamic>{'q': query};
    final Map<String, String> $headers = {
      'Accept': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updatecategoriebyid(
    String token,
    int idCategorie,
    Map<String, dynamic> body,
  ) {
    final Uri $url = Uri.parse('${apiUrl}/api/categories/${idCategorie}');
    final Map<String, String> $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addtracking(
    String token,
    Map<String, dynamic> body,
  ) {
    final Uri $url = Uri.parse('${apiUrl}/api/tracking');
    final Map<String, String> $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getetablissements(
    int idUser,
    int page,
    String lat,
    String lon,
  ) {
    final Uri $url = Uri.parse('${apiUrl}/api/etablissements');
    final Map<String, dynamic> $params = <String, dynamic>{
      'user_id': idUser,
      'page': page,
      'lat': lat,
      'lon': lon,
    };
    final Map<String, String> $headers = {
      'Accept': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getetablissementbyid(
    int idEtablissement,
    int idUser,
  ) {
    final Uri $url =
        Uri.parse('${apiUrl}/api/etablissements/${idEtablissement}');
    final Map<String, dynamic> $params = <String, dynamic>{'user_id': idUser};
    final Map<String, String> $headers = {
      'Accept': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> searchetablissements(
    String query,
    int idUser,
  ) {
    final Uri $url = Uri.parse('${apiUrl}/api/search/etablissements');
    final Map<String, dynamic> $params = <String, dynamic>{
      'q': query,
      'user_id': idUser,
    };
    final Map<String, String> $headers = {
      'Accept': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateetablissementbyid(
    String token,
    int idEtablissement,
    Map<String, dynamic> body,
  ) {
    final Uri $url =
        Uri.parse('${apiUrl}/api/etablissements/${idEtablissement}');
    final Map<String, String> $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteetablissementbyid(
    String token,
    int idEtablissement,
  ) {
    final Uri $url =
        Uri.parse('${apiUrl}/api/etablissements/${idEtablissement}');
    final Map<String, String> $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addfavoris(
    String token,
    Map<String, dynamic> body,
  ) {
    final Uri $url = Uri.parse('${apiUrl}/api/favoris/add');
    final Map<String, String> $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> removefavoris(
    String token,
    Map<String, dynamic> body,
  ) {
    final Uri $url = Uri.parse('${apiUrl}/api/favoris/remove');
    final Map<String, String> $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getfavoris(String token) {
    final Uri $url = Uri.parse('${apiUrl}/api/favoris');
    final Map<String, String> $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> searchetablissementsbyfilters(
    int idCategorie,
    int idUser,
    String? commodites,
    int? page,
    String lat,
    String lon,
  ) {
    final Uri $url = Uri.parse('${apiUrl}/api/search/etablissements/filter');
    final Map<String, dynamic> $params = <String, dynamic>{
      'id_categorie': idCategorie,
      'user_id': idUser,
      'commodites': commodites,
      'page': page,
      'lat': lat,
      'lon': lon,
    };
    final Map<String, String> $headers = {
      'Accept': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateetablissementview(int idEtablissement) {
    final Uri $url =
        Uri.parse('${apiUrl}/api/etablissements/vues/${idEtablissement}');
    final Map<String, String> $headers = {
      'Accept': 'application/json',
    };
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addreview(
    String token,
    Map<String, dynamic> body,
  ) {
    final Uri $url = Uri.parse('${apiUrl}/api/commentaires');
    final Map<String, String> $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
