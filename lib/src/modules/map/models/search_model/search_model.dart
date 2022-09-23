import 'package:json_annotation/json_annotation.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/etablissement.dart';
import 'package:position/src/modules/map/submodules/nominatim/models/nominatim.dart';

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
  Features? features;
  Etablissement? etablissement;
  Category? category;

  SearchModel(
      {this.name,
      this.id,
      this.type,
      this.logo,
      this.logomap,
      this.details,
      this.longitude,
      this.latitude,
      this.features,
      this.etablissement,
      this.category});

  @override
  String toString() {
    return 'SearchModel(name: $name, id: $id, type: $type, logo: $logo, logomap:$logomap, details: $details, longitude: $longitude, latitude: $latitude,etablissement: $etablissement,category:$category,features:$features)';
  }

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return _$SearchModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);

  SearchModel copyWith(
      {String? name,
      String? id,
      String? type,
      String? logo,
      String? logomap,
      String? details,
      String? longitude,
      String? latitude,
      Features? features,
      Etablissement? etablissement,
      Category? category}) {
    return SearchModel(
        name: name ?? this.name,
        id: id ?? this.id,
        type: type ?? this.type,
        logo: logo ?? this.logo,
        logomap: logomap ?? logomap,
        details: details ?? this.details,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        features: features ?? this.features,
        etablissement: etablissement ?? this.etablissement,
        category: category ?? this.category);
  }
}
