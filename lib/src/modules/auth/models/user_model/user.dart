import 'package:json_annotation/json_annotation.dart';

import 'abonnement.dart';
import 'role.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? name;
  String? email;
  @JsonKey(name: 'email_verified_at')
  DateTime? emailVerifiedAt;
  dynamic phone;
  @JsonKey(name: 'fcm_token')
  dynamic fcmToken;
  @JsonKey(name: 'image_profil')
  String? imageProfil;
  @JsonKey(name: 'abonnement_id')
  int? abonnementId;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  List<Role>? roles;
  Abonnement? abonnement;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.fcmToken,
    this.imageProfil,
    this.abonnementId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.roles,
    this.abonnement,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, emailVerifiedAt: $emailVerifiedAt, phone: $phone, fcmToken: $fcmToken, imageProfil: $imageProfil, abonnementId: $abonnementId, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, roles: $roles, abonnement: $abonnement)';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    int? id,
    String? name,
    String? email,
    DateTime? emailVerifiedAt,
    dynamic phone,
    dynamic fcmToken,
    String? imageProfil,
    int? abonnementId,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Role>? roles,
    Abonnement? abonnement,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      phone: phone ?? this.phone,
      fcmToken: fcmToken ?? this.fcmToken,
      imageProfil: imageProfil ?? this.imageProfil,
      abonnementId: abonnementId ?? this.abonnementId,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      roles: roles ?? this.roles,
      abonnement: abonnement ?? this.abonnement,
    );
  }
}
