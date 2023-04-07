import 'package:json_annotation/json_annotation.dart';

part 'batiment.g.dart';

@JsonSerializable()
class Batiment {
  int? id;
  String? nom;
  @JsonKey(name: 'nombre_niveau')
  int? nombreNiveau;
  String? code;
  String? longitude;
  String? latitude;
  dynamic image;
  String? indication;
  String? rue;
  String? ville;
  String? commune;
  String? quartier;

  Batiment({
    this.id,
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
  });

  @override
  String toString() {
    return 'Batiment(id: $id, nom: $nom, nombreNiveau: $nombreNiveau, code: $code, longitude: $longitude, latitude: $latitude, image: $image, indication: $indication, rue: $rue, ville: $ville, commune: $commune, quartier: $quartier)';
  }

  factory Batiment.fromJson(Map<String, dynamic> json) {
    return _$BatimentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BatimentToJson(this);

  Batiment copyWith({
    int? id,
    String? nom,
    int? nombreNiveau,
    String? code,
    String? longitude,
    String? latitude,
    dynamic image,
    String? indication,
    String? rue,
    String? ville,
    String? commune,
    String? quartier,
  }) {
    return Batiment(
      id: id ?? this.id,
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
    );
  }
}
