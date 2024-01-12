import 'package:firebase_core/firebase_core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:position/firebase_options.dart';
import 'package:position/src/core/di/di.dart' as di;
import 'package:position/src/core/utils/geolocator.dart';
import 'package:position/src/modules/map/submodules/tracking/repository/trackingRepository.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Fonction appelée par Workmanager pour exécuter une tâche en arrière-plan
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // Chargement des variables d'environnement
    await dotenv.load(fileName: ".env");

    // Initialisation de la dépendance d'injection
    await di.init();

    // Initialisation de Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Récupération de l'instance du repository de suivi
    final trackingRepository = di.getIt<TrackingRepository>();

    // Si la tâche est "addtracking"
    if (task == "addtracking") {
      // Récupération de la position actuelle
      Position position = await determinePosition();

      try {
        // Ajout des données de suivi au repository
        await trackingRepository.addtracking(
          position.longitude,
          position.latitude,
          position.speed,
          DateFormat('yyyy-MM-dd').format(position.timestamp),
        );
        // Retourne une Future avec une valeur de true si l'ajout a réussi
        return Future.value(true);
      } catch (e) {
        // Retourne une Future avec une erreur si l'ajout a échoué
        return Future.error(e);
      }
    }
    // Retourne une Future avec une valeur de false si la tâche n'est pas "addtracking"
    return Future.value(false);
  });
}
