import 'dart:convert';

class Abonnement {
  int? id;
  String? nom;
  int? prix;
  String? type;
  int? duree;
  dynamic deletedAt;
  DateTime? createdAt;
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

  factory Abonnement.fromMap(Map<String, dynamic> data) => Abonnement(
        id: data['id'] as int?,
        nom: data['nom'] as String?,
        prix: data['prix'] as int?,
        type: data['type'] as String?,
        duree: data['duree'] as int?,
        deletedAt: data['deleted_at'] as dynamic,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'nom': nom,
        'prix': prix,
        'type': type,
        'duree': duree,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Abonnement].
  factory Abonnement.fromJson(String data) {
    return Abonnement.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Abonnement] to a JSON string.
  String toJson() => json.encode(toMap());

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
