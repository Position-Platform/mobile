import 'package:json_annotation/json_annotation.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/commodites_model/commodite.dart';

part 'types_commodite.g.dart';

@JsonSerializable()
class TypesCommodite {
  int? id;
  String? nom;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  List<Commodite>? commodites;

  TypesCommodite({
    this.id,
    this.nom,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.commodites,
  });

  @override
  String toString() {
    return 'TypesCommodite(id: $id, nom: $nom, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, commodites: $commodites)';
  }

  factory TypesCommodite.fromJson(Map<String, dynamic> json) {
    return _$TypesCommoditeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TypesCommoditeToJson(this);

  TypesCommodite copyWith({
    int? id,
    String? nom,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Commodite>? commodites,
  }) {
    return TypesCommodite(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      commodites: commodites ?? this.commodites,
    );
  }
}
