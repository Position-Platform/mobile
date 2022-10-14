// ignore_for_file: file_names

import 'package:chopper/chopper.dart';

abstract class NominatimApiService {
  Future<Response> searchPlace(String query);

  Future<Response> revserse(String lon, String lat);

  Future<Response> getRoute(String coordinates);
}
