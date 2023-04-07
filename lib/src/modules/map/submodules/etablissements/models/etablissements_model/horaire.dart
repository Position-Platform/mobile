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

  Horaire({this.id, this.etablissementId, this.jour, this.plageHoraire});

  @override
  String toString() {
    return 'Horaire(id: $id, etablissementId: $etablissementId, jour: $jour, plageHoraire: $plageHoraire)';
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
  }) {
    return Horaire(
      id: id ?? this.id,
      etablissementId: etablissementId ?? this.etablissementId,
      jour: jour ?? this.jour,
      plageHoraire: plageHoraire ?? this.plageHoraire,
    );
  }
}
