import 'package:json_annotation/json_annotation.dart';
import 'category.dart';

part 'sous_category.g.dart';

@JsonSerializable()
class SousCategory {
  int? id;
  String? nom;
  @JsonKey(name: 'categorie_id')
  int? categorieId;
  String? logourl;
  String? logourlmap;
  String? color;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'categorie')
  Category? category;

  SousCategory({
    this.id,
    this.nom,
    this.categorieId,
    this.logourl,
    this.logourlmap,
    this.color,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  @override
  String toString() {
    return 'SousCategory(id: $id, nom: $nom, categorieId: $categorieId, logourl: $logourl, logourlmap: $logourlmap, color:$color, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt,category:$category)';
  }

  factory SousCategory.fromJson(Map<String, dynamic> json) {
    return _$SousCategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SousCategoryToJson(this);

  SousCategory copyWith(
      {int? id,
      String? nom,
      int? categorieId,
      String? logourl,
      String? logourlmap,
      String? color,
      dynamic deletedAt,
      DateTime? createdAt,
      DateTime? updatedAt,
      Category? category}) {
    return SousCategory(
        id: id ?? this.id,
        nom: nom ?? this.nom,
        categorieId: categorieId ?? this.categorieId,
        logourl: logourl ?? this.logourl,
        logourlmap: logourlmap ?? this.logourlmap,
        color: color ?? this.color,
        deletedAt: deletedAt ?? this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        category: category ?? this.category);
  }
}
