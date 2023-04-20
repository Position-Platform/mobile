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
    String countrycodes,
  ) {
    final Uri $url = Uri.parse('https://nominatim.openstreetmap.org/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'q': query,
      'format': format,
      'polygon': polygon,
      'addressdetails': adressdetails,
      'countrycodes': countrycodes,
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
  Future<Response<dynamic>> reverse(
    String format,
    String lon,
    String lat,
  ) {
    final Uri $url = Uri.parse('https://nominatim.openstreetmap.org/reverse');
    final Map<String, dynamic> $params = <String, dynamic>{
      'format': format,
      'lon': lon,
      'lat': lat,
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
}
