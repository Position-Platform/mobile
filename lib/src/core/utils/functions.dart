import 'package:geolocator/geolocator.dart';
import 'package:turf/turf.dart' as turf;
import 'package:url_launcher/url_launcher.dart';

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

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}
