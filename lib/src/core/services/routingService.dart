// ignore_for_file: file_names

import 'package:chopper/chopper.dart';
import 'package:position/src/core/utils/configs.dart';

part 'routingService.chopper.dart';

// Classe RoutingService qui étend ChopperService et est annotée avec @ChopperApi
@ChopperApi(baseUrl: routingUrl)
abstract class RoutingService extends ChopperService {
  // Méthode statique pour créer une instance de RoutingService à l'aide d'un client ChopperClient
  static RoutingService create([ChopperClient? client]) =>
      _$RoutingService(client);

  // API de calcul de route
  @Get(path: '/{coordinates}', headers: {'Accept': 'application/json'})
  Future<Response> getroute(
    @Path('coordinates') String coordinates,
    @Query('overview') String overview,
    @Query('geometries') String geometries,
    @Query('steps') String steps,
  );
}
