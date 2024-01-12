// ignore_for_file: file_names

import 'package:chopper/chopper.dart';
import 'package:position/src/core/utils/configs.dart';

part 'nominatimService.chopper.dart';

// Classe NominatimService qui étend ChopperService et est annotée avec @ChopperApi
@ChopperApi(baseUrl: nominatimUrl)
abstract class NominatimService extends ChopperService {
  // Méthode statique pour créer une instance de NominatimService à l'aide d'un client ChopperClient
  static NominatimService create([ChopperClient? client]) =>
      _$NominatimService(client);

  // API de recherche de lieu
  @Get(path: '/search', headers: {'Accept': 'application/json'})
  Future<Response> searchplace(
    @Query('q') String query,
    @Query('format') String format,
    @Query('polygon') String polygon,
    @Query('addressdetails') String adressdetails,
    @Query('countrycodes') String countrycodes,
  );

  // API de géocodage inverse
  @Get(path: '/reverse', headers: {'Accept': 'application/json'})
  Future<Response> reverse(
    @Query('format') String format,
    @Query('lon') String longitude,
    @Query('lat') String latitude,
  );
}
