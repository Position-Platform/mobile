import 'package:json_annotation/json_annotation.dart';

part 'sous_category.g.dart';

@JsonSerializable()
class SousCategory {
  int? id;
  String? nom;
  @JsonKey(name: 'categorie_id')
  int? categorieId;
  dynamic logourl;
  dynamic logourlmap;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  SousCategory({
    this.id,
    this.nom,
    this.categorieId,
    this.logourl,
    this.logourlmap,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'SousCategory(id: $id, nom: $nom, categorieId: $categorieId, logourl: $logourl, logourlmap: $logourlmap, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory SousCategory.fromJson(Map<String, dynamic> json) {
    return _$SousCategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SousCategoryToJson(this);

  SousCategory copyWith({
    int? id,
    String? nom,
    int? categorieId,
    dynamic logourl,
    dynamic logourlmap,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SousCategory(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      categorieId: categorieId ?? this.categorieId,
      logourl: logourl ?? this.logourl,
      logourlmap: logourlmap ?? this.logourlmap,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
