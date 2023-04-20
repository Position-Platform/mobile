// ignore_for_file: file_names

import 'package:position/src/core/utils/result.dart';
import 'package:position/src/modules/map/submodules/tracking/model/tracking_model/tracking_model.dart';

abstract class TrackingRepository {
  Future<Result<TrackingModel>> addtracking(
      double longitude, double latitude, double speed, String timestamp);
}
