class Reverse {
  String? type;
  String? licence;
  List<Features>? features;

  Reverse({this.type, this.licence, this.features});

  Reverse.fromJson(Map<String, dynamic> json) {
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

  Features({this.type, this.properties, this.bbox, this.geometry});

  Features.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
    bbox = json['bbox'].cast<double>();
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
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
    return data;
  }
}

class Properties {
  int? placeId;
  String? osmType;
  int? osmId;
  int? placeRank;
  String? category;
  String? type;
  dynamic importance;
  String? addresstype;
  String? name;
  String? displayName;
  Address? address;

  Properties(
      {this.placeId,
      this.osmType,
      this.osmId,
      this.placeRank,
      this.category,
      this.type,
      this.importance,
      this.addresstype,
      this.name,
      this.displayName,
      this.address});

  Properties.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    osmType = json['osm_type'];
    osmId = json['osm_id'];
    placeRank = json['place_rank'];
    category = json['category'];
    type = json['type'];
    importance = json['importance'];
    addresstype = json['addresstype'];
    name = json['name'];
    displayName = json['display_name'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['place_id'] = placeId;
    data['osm_type'] = osmType;
    data['osm_id'] = osmId;
    data['place_rank'] = placeRank;
    data['category'] = category;
    data['type'] = type;
    data['importance'] = importance;
    data['addresstype'] = addresstype;
    data['name'] = name;
    data['display_name'] = displayName;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    return data;
  }
}

class Address {
  String? road;
  String? village;
  String? town;
  String? county;
  String? state;
  String? iSO31662Lvl4;
  String? country;
  String? countryCode;

  Address(
      {this.road,
      this.village,
      this.town,
      this.county,
      this.state,
      this.iSO31662Lvl4,
      this.country,
      this.countryCode});

  Address.fromJson(Map<String, dynamic> json) {
    road = json['road'];
    village = json['village'];
    town = json['town'];
    county = json['county'];
    state = json['state'];
    iSO31662Lvl4 = json['ISO3166-2-lvl4'];
    country = json['country'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['road'] = road;
    data['village'] = village;
    data['town'] = town;
    data['county'] = county;
    data['state'] = state;
    data['ISO3166-2-lvl4'] = iSO31662Lvl4;
    data['country'] = country;
    data['country_code'] = countryCode;
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
