import 'package:flutter_dotenv/flutter_dotenv.dart';

// URL de base pour l'API
const String apiUrl = "https://api.position.cm";

// Clés d'API pour l'authentification
String? apiKey = dotenv.env['API_KEY'];
String? mapboxApiKey = dotenv.env['MAPBOX_API_KEY'];

// Zoom initial pour la carte
const double initialMapZoom = 15.0;

// URL de base pour l'API de géocodage
const String nominatimUrl = "https://nominatim.openstreetmap.org";

// URL de base pour l'API de calcul de route
const String routingUrl = "https://router.project-osrm.org/route/v1/driving";
