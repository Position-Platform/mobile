// ignore_for_file: file_names

import 'package:chopper/chopper.dart';
import 'package:position/src/core/helpers/network.dart';
import 'package:position/src/modules/map/submodules/nominatim/api/nominatimApiService.dart';
import 'package:position/src/modules/map/submodules/nominatim/models/nominatim.dart';
import 'package:position/src/core/utils/result.dart';
import 'package:position/src/modules/map/submodules/nominatim/models/reverse.dart';
import 'package:position/src/modules/map/submodules/nominatim/repository/nominatimRepository.dart';

class NominatimRepositoryImpl implements NominatimRepository {
  final NetworkInfoHelper? networkInfoHelper;
  final NominatimApiService? nominatimApiService;

  NominatimRepositoryImpl({this.networkInfoHelper, this.nominatimApiService});
  @override
  Future<Result<NominatimModel>> searchplace(String query) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response = await nominatimApiService!.searchPlace(query);

        var model = NominatimModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result<Reverse>> reverse(String lon, String lat) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    if (isConnected) {
      try {
        final Response response = await nominatimApiService!.revserse(lon, lat);

        var model = Reverse.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }
}
