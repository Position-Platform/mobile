import 'package:json_annotation/json_annotation.dart';

part 'pivot.g.dart';

@JsonSerializable()
class Pivot {
  @JsonKey(name: 'etablissement_id')
  int? etablissementId;
  @JsonKey(name: 'sous_categorie_id')
  int? sousCategorieId;

  Pivot({this.etablissementId, this.sousCategorieId});

  @override
  String toString() {
    return 'Pivot(etablissementId: $etablissementId, sousCategorieId: $sousCategorieId)';
  }

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  Map<String, dynamic> toJson() => _$PivotToJson(this);

  Pivot copyWith({
    int? etablissementId,
    int? sousCategorieId,
  }) {
    return Pivot(
      etablissementId: etablissementId ?? this.etablissementId,
      sousCategorieId: sousCategorieId ?? this.sousCategorieId,
    );
  }
}
