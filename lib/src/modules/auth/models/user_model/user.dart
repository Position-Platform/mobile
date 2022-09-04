import 'dart:convert';

import 'abonnement.dart';
import 'role.dart';

class User {
  int? id;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  String? phone;
  dynamic fcmToken;
  dynamic imageProfil;
  int? abonnementId;
  dynamic deletedAt;
  DateTime? createdAt;
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

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data['id'] as int?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        emailVerifiedAt: data['email_verified_at'] == null
            ? null
            : DateTime.parse(data['email_verified_at'] as String),
        phone: data['phone'] as String?,
        fcmToken: data['fcm_token'] as dynamic,
        imageProfil: data['image_profil'] as dynamic,
        abonnementId: data['abonnement_id'] as int?,
        deletedAt: data['deleted_at'] as dynamic,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        roles: (data['roles'] as List<dynamic>?)
            ?.map((e) => Role.fromMap(e as Map<String, dynamic>))
            .toList(),
        abonnement: data['abonnement'] == null
            ? null
            : Abonnement.fromMap(data['abonnement'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'email_verified_at': emailVerifiedAt?.toIso8601String(),
        'phone': phone,
        'fcm_token': fcmToken,
        'image_profil': imageProfil,
        'abonnement_id': abonnementId,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'roles': roles?.map((e) => e.toMap()).toList(),
        'abonnement': abonnement?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());

  User copyWith({
    int? id,
    String? name,
    String? email,
    DateTime? emailVerifiedAt,
    String? phone,
    dynamic fcmToken,
    dynamic imageProfil,
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
