// ignore_for_file: file_names

import 'dart:convert';

import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/datum.dart';

// Cette fonction prend une liste d'objets Datum en entrée et renvoie un objet Map au format GeoJSON.
Map<String, Object?> createGeoJsonEtablissements(List<Datum>? data) {
  // Crée une liste vide qui sera utilisée pour stocker les entités GeoJSON.
  var responses = data?.map((element) {
    // Crée un objet geometry qui représente l'emplacement du point de l'établissement en utilisant ses coordonnées de longitude et de latitude.
    var geometry = {
      "type": "Point",
      "coordinates": [element.batiment!.longitude, element.batiment!.latitude],
    };

    // Crée un objet properties qui contient toutes les propriétés de l'établissement telles que son nom, son adresse, son numéro de téléphone, son site web et d'autres détails.
    var properties = {
      "id": element.id,
      "nom": element.nom,
      "indication_adresse": element.indicationAdresse,
      "code_postal": element.codePostal,
      "site_internet": element.siteInternet,
      "nom_manager": element.nomManager,
      "contact_manager": element.contactManager,
      "etage": element.etage,
      "cover": element.cover,
      "phone": element.phone,
      "whatsapp1": element.whatsapp1,
      "whatsapp2": element.whatsapp2,
      "description": element.description,
      "osm_id": element.osmId,
      "services": element.services,
      "ameliorations": element.ameliorations,
      "vues": element.vues,
      "logo": element.logo,
      "logo_map": element.logoMap,
      "isFavoris": element.isFavoris,
      "moyenne": element.moyenne,
      "avis": element.avis,
      "count": element.count?.map((i) => json.encode(i)).toList(),
      "batiment": json.encode(element.batiment),
      "sous_categories":
          element.sousCategories?.map((i) => json.encode(i)).toList(),
      "commodites": element.commodites,
      "images": element.images?.map((i) => json.encode(i)).toList(),
      "horaires": element.horaires?.map((i) => json.encode(i)).toList(),
      "commentaires": element.commentaires?.map((i) => json.encode(i)).toList(),
      "user": json.encode(element.user),
      "isopen": element.isopen
    };

    // Crée un objet response qui est une entité GeoJSON contenant l'objet geometry et l'objet properties.
    return {
      "type": 'Feature',
      "geometry": geometry,
      "properties": properties,
    };
  }).toList();

  // Crée un objet geojson qui est une collection d'entités GeoJSON contenant toutes les entités GeoJSON créées par la fonction.
  var geojson = {
    "type": 'FeatureCollection',
    "features": responses,
  };

  // Renvoie l'objet geojson.
  return geojson;
}
