import 'package:firebase_core/firebase_core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:position/firebase_options.dart';
import 'package:position/src/core/di/di.dart' as di;
import 'package:position/src/core/utils/geolocator.dart';
import 'package:position/src/modules/map/submodules/tracking/repository/trackingRepository.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    await dotenv.load(fileName: ".env");
    await di.init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final trackingRepository = di.getIt<TrackingRepository>();
    if (task == "addtracking") {
      Position position = await determinePosition();

      try {
        await trackingRepository.addtracking(
            position.longitude,
            position.latitude,
            position.speed,
            DateFormat('yyyy-MM-dd').format(position.timestamp!));
        return Future.value(true);
      } catch (e) {
        return Future.error(e);
      }
    }
    return Future.value(false);
  });
}
