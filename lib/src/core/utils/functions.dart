import 'package:geolocator/geolocator.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/datum.dart';
import 'package:turf/turf.dart' as turf;
import 'package:url_launcher/url_launcher.dart';

// Fonction pour calculer la distance entre deux points géographiques
Future<double> calculateDistance(String longitude, String latitude) async {
  var position = await Geolocator.getCurrentPosition();
  var positionFrom = turf.Point(
      coordinates: turf.Position(position.longitude, position.latitude));

  var positionTo = turf.Point(
      coordinates:
          turf.Position(double.parse(longitude), double.parse(latitude)));

  var distance = turf.distance(positionFrom, positionTo);
  double result = double.parse(distance.toStringAsFixed(2));

  return result;
}

// Fonction pour lancer un appel téléphonique
Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

// Fonction pour vérifier si un établissement est ouvert
String checkIfEtablissementIsOpen(Datum etablissement) {
  var now = DateTime.now().weekday;
  String plageHoraire = "";

  // Utilisation de constantes pour les jours de la semaine
  const String lundi = "lundi";
  const String mardi = "mardi";
  const String mercredi = "mercredi";
  const String jeudi = "jeudi";
  const String vendredi = "vendredi";
  const String samedi = "samedi";
  const String dimanche = "dimanche";

  for (var i = 0; i < etablissement.horaires!.length; i++) {
    if (etablissement.horaires![i].jour == lundi && now == 1) {
      plageHoraire = etablissement.horaires![i].plageHoraire!;
    } else if (etablissement.horaires![i].jour == mardi && now == 2) {
      plageHoraire = etablissement.horaires![i].plageHoraire!;
    } else if (etablissement.horaires![i].jour == mercredi && now == 3) {
      plageHoraire = etablissement.horaires![i].plageHoraire!;
    } else if (etablissement.horaires![i].jour == jeudi && now == 4) {
      plageHoraire = etablissement.horaires![i].plageHoraire!;
    } else if (etablissement.horaires![i].jour == vendredi && now == 5) {
      plageHoraire = etablissement.horaires![i].plageHoraire!;
    } else if (etablissement.horaires![i].jour == samedi && now == 6) {
      plageHoraire = etablissement.horaires![i].plageHoraire!;
    } else if (etablissement.horaires![i].jour == dimanche && now == 7) {
      plageHoraire = etablissement.horaires![i].plageHoraire!;
    }
  }

  return plageHoraire;
}
