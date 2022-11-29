import 'package:json_annotation/json_annotation.dart';

part 'batiment.g.dart';

@JsonSerializable()
class Batiment {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  String? nom;
  @JsonKey(name: 'nombre_niveau')
  String? nombreNiveau;
  String? code;
  String? longitude;
  String? latitude;
  String? image;
  String? indication;
  String? rue;
  String? ville;
  String? commune;
  String? quartier;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  Batiment({
    this.id,
    this.userId,
    this.nom,
    this.nombreNiveau,
    this.code,
    this.longitude,
    this.latitude,
    this.image,
    this.indication,
    this.rue,
    this.ville,
    this.commune,
    this.quartier,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Batiment(id: $id, userId: $userId, nom: $nom, nombreNiveau: $nombreNiveau, code: $code, longitude: $longitude, latitude: $latitude, image: $image, indication: $indication, rue: $rue, ville: $ville, commune: $commune, quartier: $quartier, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Batiment.fromJson(Map<String, dynamic> json) {
    return _$BatimentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BatimentToJson(this);

  Batiment copyWith({
    int? id,
    int? userId,
    String? nom,
    String? nombreNiveau,
    String? code,
    String? longitude,
    String? latitude,
    String? image,
    dynamic indication,
    String? rue,
    String? ville,
    String? commune,
    String? quartier,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Batiment(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      nom: nom ?? this.nom,
      nombreNiveau: nombreNiveau ?? this.nombreNiveau,
      code: code ?? this.code,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      image: image ?? this.image,
      indication: indication ?? this.indication,
      rue: rue ?? this.rue,
      ville: ville ?? this.ville,
      commune: commune ?? this.commune,
      quartier: quartier ?? this.quartier,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
