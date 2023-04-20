// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routingService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RoutingService extends RoutingService {
  _$RoutingService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RoutingService;

  @override
  Future<Response<dynamic>> getroute(
    String coordinates,
    String overview,
    String geometries,
    String steps,
  ) {
    final Uri $url = Uri.parse(
        'https://router.project-osrm.org/route/v1/driving/${coordinates}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'overview': overview,
      'geometries': geometries,
      'steps': steps,
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
