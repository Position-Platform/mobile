// ignore_for_file: file_names

import 'dart:convert';

import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/etablissement.dart';

Map<String, Object> createGeoJsonEtablissements(List<Etablissement>? data) {
  var responses = [];

  for (var i = 0; i < data!.length; i++) {
    var element = data[i];
    var geometry = {
      "type": "Point",
      "coordinates": [element.batiment!.longitude, element.batiment!.latitude],
    };

    var properties = {
      "id": element.id,
      "nom": element.nom,
      "batiment_id": element.batimentId,
      "indication_adresse": element.indicationAdresse,
      "code_postal": element.codePostal,
      "site_internet": element.siteInternet,
      "nom_manager": element.nomManager,
      "contact_manager": element.contactManager,
      "user_id": element.userId,
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
      "commodites": element.commodites?.map((i) => json.encode(i)).toList(),
      "images": element.images?.map((i) => json.encode(i)).toList(),
      "horaires": element.horaires?.map((i) => json.encode(i)).toList(),
      "commentaires": element.commentaires?.map((i) => json.encode(i)).toList(),
      "user": json.encode(element.user),
      "isopen": element.isopen
    };

    responses.add({
      "type": 'Feature',
      "geometry": geometry,
      "properties": properties,
    });
  }

  var geojson = {
    "type": 'FeatureCollection',
    "features": responses,
  };

  return geojson;
}
