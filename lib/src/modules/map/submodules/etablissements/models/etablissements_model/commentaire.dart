import 'package:json_annotation/json_annotation.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';

part 'commentaire.g.dart';

@JsonSerializable()
class Commentaire {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  String? commentaire;
  int? rating;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  User? user;

  Commentaire({
    this.id,
    this.userId,
    this.commentaire,
    this.rating,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  @override
  String toString() {
    return 'Commentaire(id: $id, userId: $userId, commentaire: $commentaire, rating: $rating, deletedAt: $deletedAt, createdAt: $createdAt,updatedAt:$updatedAt, user: $user)';
  }

  factory Commentaire.fromJson(Map<String, dynamic> json) {
    return _$CommentaireFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommentaireToJson(this);

  Commentaire copyWith({
    int? id,
    int? userId,
    String? commentaire,
    int? rating,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    User? user,
  }) {
    return Commentaire(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      commentaire: commentaire ?? this.commentaire,
      rating: rating ?? this.rating,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      user: user ?? this.user,
    );
  }
}
