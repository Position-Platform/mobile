// ignore_for_file: file_names

import 'package:position/src/core/utils/result.dart';
import 'package:position/src/modules/map/submodules/nominatim/models/nominatim.dart';
import 'package:position/src/modules/map/submodules/nominatim/models/reverse.dart';

abstract class NominatimRepository {
  Future<Result<NominatimModel>> searchplace(String query);

  Future<Result<Reverse>> reverse(String lon, String lat);
}
