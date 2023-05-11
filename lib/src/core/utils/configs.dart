import 'package:flutter_dotenv/flutter_dotenv.dart';

const String apiUrl = "https://services.position.cm";
String? apiKey = dotenv.env['API_KEY'];
String? mapboxApiKey = dotenv.env['MAPBOX_API_KEY'];
const double initMapZoom = 15.0;
const String nominatimUrl = "https://nominatim.openstreetmap.org";
const String routingUrl = "https://routing.position.cm/route/v1/driving";
