import 'package:json_annotation/json_annotation.dart';

import 'sous_category.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  int? id;
  String? nom;
  String? shortname;
  String? logourl;
  String? logourlmap;
  int? vues;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'sous_categories')
  List<SousCategory>? sousCategories;

  Category({
    this.id,
    this.nom,
    this.shortname,
    this.logourl,
    this.logourlmap,
    this.vues,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.sousCategories,
  });

  @override
  String toString() {
    return 'Category(id: $id, nom: $nom, shortname: $shortname, logourl: $logourl, logourlmap: $logourlmap, vues: $vues, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, sousCategories: $sousCategories)';
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  Category copyWith({
    int? id,
    String? nom,
    String? shortname,
    String? logourl,
    String? logourlmap,
    int? vues,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<SousCategory>? sousCategories,
  }) {
    return Category(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      shortname: shortname ?? this.shortname,
      logourl: logourl ?? this.logourl,
      logourlmap: logourlmap ?? this.logourlmap,
      vues: vues ?? this.vues,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      sousCategories: sousCategories ?? this.sousCategories,
    );
  }
}
