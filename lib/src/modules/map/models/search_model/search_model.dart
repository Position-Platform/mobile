import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  String? name;
  String? id;
  String? type;
  String? logo;
  String? logomap;
  String? details;
  String? longitude;
  String? latitude;

  SearchModel({
    this.name,
    this.id,
    this.type,
    this.logo,
    this.logomap,
    this.details,
    this.longitude,
    this.latitude,
  });

  @override
  String toString() {
    return 'SearchModel(name: $name, id: $id, type: $type, logo: $logo, logomap:$logomap, details: $details, longitude: $longitude, latitude: $latitude)';
  }

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return _$SearchModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);

  SearchModel copyWith({
    String? name,
    String? id,
    String? type,
    String? logo,
    String? logomap,
    String? details,
    String? longitude,
    String? latitude,
  }) {
    return SearchModel(
      name: name ?? this.name,
      id: id ?? this.id,
      type: type ?? this.type,
      logo: logo ?? this.logo,
      logomap: logomap ?? logomap,
      details: details ?? this.details,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }
}
