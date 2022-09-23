import 'package:json_annotation/json_annotation.dart';

part 'horaire.g.dart';

@JsonSerializable()
class Horaire {
  int? id;
  @JsonKey(name: 'etablissement_id')
  int? etablissementId;
  String? jour;
  @JsonKey(name: 'plage_horaire')
  String? plageHoraire;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  Horaire({
    this.id,
    this.etablissementId,
    this.jour,
    this.plageHoraire,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Horaire(id: $id, etablissementId: $etablissementId, jour: $jour, plageHoraire: $plageHoraire, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Horaire.fromJson(Map<String, dynamic> json) {
    return _$HoraireFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HoraireToJson(this);

  Horaire copyWith({
    int? id,
    int? etablissementId,
    String? jour,
    String? plageHoraire,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Horaire(
      id: id ?? this.id,
      etablissementId: etablissementId ?? this.etablissementId,
      jour: jour ?? this.jour,
      plageHoraire: plageHoraire ?? this.plageHoraire,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
