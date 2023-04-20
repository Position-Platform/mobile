// ignore_for_file: avoid_print, file_names

import 'package:chopper/chopper.dart';
import 'package:position/src/core/services/apiService.dart';
import 'package:position/src/modules/map/submodules/tracking/api/trackingApiService.dart';

class TrackingApiServiceFactory implements TrackingApiService {
  final ApiService? apiService;

  TrackingApiServiceFactory(this.apiService);

  @override
  Future<Response> addtracking(String token, double longitude, double latitude,
      double speed, String timestamp) async {
    Response response;
    try {
      response = await apiService!.addtracking(token, {
        "longitude": longitude,
        "latitude": latitude,
        "speed": speed,
        "timestamp": timestamp
      });
    } catch (e) {
      print('Caught ${e.toString()}');
      rethrow;
    }
    return response;
  }
}
