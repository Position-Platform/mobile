// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nominatimService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$NominatimService extends NominatimService {
  _$NominatimService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = NominatimService;

  @override
  Future<Response<dynamic>> searchplace(
    String query,
    String format,
    String polygon,
    String adressdetails,
  ) {
    final $url = 'https://nominatim.openstreetmap.org/search';
    final $params = <String, dynamic>{
      'q': query,
      'format': format,
      'polygon': polygon,
      'addressdetails': adressdetails,
    };
    final $headers = {
      'Accept': 'application/json',
    };

    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> reverse(
    String format,
    String lon,
    String lat,
  ) {
    final $url = 'https://nominatim.openstreetmap.org/reverse';
    final $params = <String, dynamic>{
      'format': format,
      'lon': lon,
      'lat': lat,
    };
    final $headers = {
      'Accept': 'application/json',
    };

    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
