// ignore_for_file: file_names

import 'package:position/src/core/utils/result.dart';
import 'package:position/src/modules/map/submodules/nominatim/models/nominatim.dart';

abstract class NominatimRepository {
  Future<Result<NominatimModel>> searchplace(String query);
}
