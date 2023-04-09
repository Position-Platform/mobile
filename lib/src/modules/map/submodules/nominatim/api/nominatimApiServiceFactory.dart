// ignore_for_file: file_names, avoid_print

import 'package:chopper/chopper.dart';
import 'package:position/src/core/services/nominatimService.dart';
import 'package:position/src/core/services/routingService.dart';
import 'package:position/src/modules/map/submodules/nominatim/api/nominatimApiService.dart';

class NominatimApiServiceFactory implements NominatimApiService {
  final NominatimService? nominatimService;
  final RoutingService? routingService;

  NominatimApiServiceFactory(this.nominatimService, this.routingService);

  @override
  Future<Response> searchPlace(String query) async {
    Response response;

    try {
      response =
          await nominatimService!.searchplace(query, "geojson", "0", "1", "cm");
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> revserse(String lon, String lat) async {
    Response response;

    try {
      response = await nominatimService!.reverse("geojson", lon, lat);
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> getRoute(String coordinates) async {
    Response response;

    try {
      response = await routingService!
          .getroute(coordinates, "full", "geojson", "false");
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }
}
