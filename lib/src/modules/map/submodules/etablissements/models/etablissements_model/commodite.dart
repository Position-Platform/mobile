import 'package:json_annotation/json_annotation.dart';

part 'commodite.g.dart';

@JsonSerializable()
class Commodite {
  int? id;
  String? nom;
  @JsonKey(name: 'type_commodite_id')
  int? typeCommoditeId;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  Commodite({
    this.id,
    this.nom,
    this.typeCommoditeId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Commodite(id: $id, nom: $nom, typeCommoditeId: $typeCommoditeId, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Commodite.fromJson(Map<String, dynamic> json) {
    return _$CommoditeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommoditeToJson(this);

  Commodite copyWith({
    int? id,
    String? nom,
    int? typeCommoditeId,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Commodite(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      typeCommoditeId: typeCommoditeId ?? this.typeCommoditeId,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
