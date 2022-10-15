import 'package:geolocator/geolocator.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/etablissement.dart';
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

String checkIfEtablissementIsOpen(Etablissement etablissement) {
  var now = DateTime.now().weekday;
  String plage = "";

  for (var i = 0; i < etablissement.horaires!.length; i++) {
    if (etablissement.horaires![i].jour == "lundi" && now == 1) {
      plage = etablissement.horaires![i].plageHoraire!;
    } else if (etablissement.horaires![i].jour == "mardi" && now == 2) {
      plage = etablissement.horaires![i].plageHoraire!;
    } else if (etablissement.horaires![i].jour == "mercredi" && now == 3) {
      plage = etablissement.horaires![i].plageHoraire!;
    } else if (etablissement.horaires![i].jour == "jeudi" && now == 4) {
      plage = etablissement.horaires![i].plageHoraire!;
    } else if (etablissement.horaires![i].jour == "vendredi" && now == 5) {
      plage = etablissement.horaires![i].plageHoraire!;
    } else if (etablissement.horaires![i].jour == "samedi" && now == 6) {
      plage = etablissement.horaires![i].plageHoraire!;
    } else if (etablissement.horaires![i].jour == "dimanche" && now == 7) {
      plage = etablissement.horaires![i].plageHoraire!;
    }
  }

  return plage;
}
