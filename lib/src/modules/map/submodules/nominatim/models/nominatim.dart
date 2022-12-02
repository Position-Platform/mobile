class NominatimModel {
  String? type;
  String? licence;
  List<Features>? features;

  NominatimModel({this.type, this.licence, this.features});

  NominatimModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    licence = json['licence'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['licence'] = licence;
    if (features != null) {
      data['features'] = features!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Features {
  String? type;
  Properties? properties;
  List<double>? bbox;
  Geometry? geometry;
  double? distance;

  Features(
      {this.type, this.properties, this.bbox, this.geometry, this.distance});

  Features.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
    bbox = json['bbox'].cast<double>();
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (properties != null) {
      data['properties'] = properties!.toJson();
    }
    data['bbox'] = bbox;
    if (geometry != null) {
      data['geometry'] = geometry!.toJson();
    }
    data['distance'] = distance;
    return data;
  }
}

class Properties {
  int? placeId;
  String? osmType;
  int? osmId;
  String? displayName;
  int? placeRank;
  String? category;
  String? type;
  double? importance;
  String? icon;
  Address? address;

  Properties(
      {this.placeId,
      this.osmType,
      this.osmId,
      this.displayName,
      this.placeRank,
      this.category,
      this.type,
      this.importance,
      this.icon,
      this.address});

  Properties.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    osmType = json['osm_type'];
    osmId = json['osm_id'];
    displayName = json['display_name'];
    placeRank = json['place_rank'];
    category = json['category'];
    type = json['type'];
    importance = json['importance'];
    icon = json['icon'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['place_id'] = placeId;
    data['osm_type'] = osmType;
    data['osm_id'] = osmId;
    data['display_name'] = displayName;
    data['place_rank'] = placeRank;
    data['category'] = category;
    data['type'] = type;
    data['importance'] = importance;
    data['icon'] = icon;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    return data;
  }
}

class Address {
  String? town;
  String? municipality;
  String? county;
  String? iSO31662Lvl6;
  String? state;
  String? iSO31662Lvl4;
  String? region;
  String? postcode;
  String? country;
  String? countryCode;
  String? village;
  String? province;
  String? natural;
  String? hamlet;

  Address(
      {this.town,
      this.municipality,
      this.county,
      this.iSO31662Lvl6,
      this.state,
      this.iSO31662Lvl4,
      this.region,
      this.postcode,
      this.country,
      this.countryCode,
      this.village,
      this.province,
      this.natural,
      this.hamlet});

  Address.fromJson(Map<String, dynamic> json) {
    town = json['town'];
    municipality = json['municipality'];
    county = json['county'];
    iSO31662Lvl6 = json['ISO3166-2-lvl6'];
    state = json['state'];
    iSO31662Lvl4 = json['ISO3166-2-lvl4'];
    region = json['region'];
    postcode = json['postcode'];
    country = json['country'];
    countryCode = json['country_code'];
    village = json['village'];
    province = json['province'];
    natural = json['natural'];
    hamlet = json['hamlet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['town'] = town;
    data['municipality'] = municipality;
    data['county'] = county;
    data['ISO3166-2-lvl6'] = iSO31662Lvl6;
    data['state'] = state;
    data['ISO3166-2-lvl4'] = iSO31662Lvl4;
    data['region'] = region;
    data['postcode'] = postcode;
    data['country'] = country;
    data['country_code'] = countryCode;
    data['village'] = village;
    data['province'] = province;
    data['natural'] = natural;
    data['hamlet'] = hamlet;
    return data;
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({this.type, this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}
