// ignore_for_file: file_names

import 'package:chopper/chopper.dart';
import 'package:position/src/core/helpers/network.dart';
import 'package:position/src/core/helpers/sharedpreferences.dart';
import 'package:position/src/core/utils/result.dart';
import 'package:position/src/modules/map/submodules/tracking/api/trackingApiService.dart';
import 'package:position/src/modules/map/submodules/tracking/model/tracking_model/tracking_model.dart';
import 'package:position/src/modules/map/submodules/tracking/repository/trackingRepository.dart';

class TrackingRepositoryImpl implements TrackingRepository {
  final NetworkInfoHelper? networkInfoHelper;
  final TrackingApiService? trackingApiService;
  final SharedPreferencesHelper? sharedPreferencesHelper;

  TrackingRepositoryImpl(
      {this.networkInfoHelper,
      this.trackingApiService,
      this.sharedPreferencesHelper});

  @override
  Future<Result<TrackingModel>> addtracking(
      double longitude, double latitude, double speed, String timestamp) async {
    bool isConnected = await networkInfoHelper!.isConnected();
    String? token = await sharedPreferencesHelper!.getToken();
    if (isConnected) {
      try {
        final Response response = await trackingApiService!
            .addtracking(token!, longitude, latitude, speed, timestamp);

        var model = TrackingModel.fromJson(response.body);

        return Result(success: model);
      } catch (e) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }
}
