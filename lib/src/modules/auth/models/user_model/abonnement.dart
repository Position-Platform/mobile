import 'package:json_annotation/json_annotation.dart';

part 'abonnement.g.dart';

@JsonSerializable()
class Abonnement {
  int? id;
  String? nom;
  int? prix;
  String? type;
  int? duree;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  Abonnement({
    this.id,
    this.nom,
    this.prix,
    this.type,
    this.duree,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Abonnement(id: $id, nom: $nom, prix: $prix, type: $type, duree: $duree, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Abonnement.fromJson(Map<String, dynamic> json) {
    return _$AbonnementFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AbonnementToJson(this);

  Abonnement copyWith({
    int? id,
    String? nom,
    int? prix,
    String? type,
    int? duree,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Abonnement(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      prix: prix ?? this.prix,
      type: type ?? this.type,
      duree: duree ?? this.duree,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
