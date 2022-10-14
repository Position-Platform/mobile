// ignore_for_file: file_names

import 'package:chopper/chopper.dart';
import 'package:position/src/core/utils/configs.dart';

part 'routingService.chopper.dart';

@ChopperApi(baseUrl: routingUrl)
abstract class RoutingService extends ChopperService {
  static RoutingService create([ChopperClient? client]) =>
      _$RoutingService(client);

  @Get(path: '/{coordinates}', headers: {'Accept': 'application/json'})
  Future<Response> getroute(
    @Path('coordinates') String coordinates,
    @Query('overview') String overview,
    @Query('geometries') String geometries,
    @Query('steps') String steps,
  );
}
