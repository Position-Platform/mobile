// ignore_for_file: file_names

import 'package:chopper/chopper.dart';
import 'package:position/src/core/utils/configs.dart';

part 'nominatimService.chopper.dart';

@ChopperApi(baseUrl: nominatimUrl)
abstract class NominatimService extends ChopperService {
  static NominatimService create([ChopperClient? client]) =>
      _$NominatimService(client);

  @Get(path: '/search', headers: {'Accept': 'application/json'})
  Future<Response> searchplace(
      @Query('q') String query,
      @Query('format') String format,
      @Query('polygon') String polygon,
      @Query('addressdetails') String adressdetails);
}
