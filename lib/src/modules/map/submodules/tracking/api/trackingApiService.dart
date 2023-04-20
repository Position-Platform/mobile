// ignore_for_file: file_names

import 'package:chopper/chopper.dart';

abstract class TrackingApiService {
  Future<Response> addtracking(String token, double longitude, double latitude,
      double speed, String timestamp);
}
