import 'package:geolocator/geolocator.dart';
import 'package:turf/turf.dart' as turf;

Future<double> calculateDistance(String lon, String lat) async {
  var position = await Geolocator.getCurrentPosition();
  var posiFrom = turf.Point(
      coordinates: turf.Position(position.longitude, position.latitude));

  var posiTo = turf.Point(
      coordinates: turf.Position(double.parse(lon), double.parse(lat)));

  var distance = turf.distance(posiFrom, posiTo);
  double result = double.parse(distance.toString());

  return result;
}
