import 'package:json_annotation/json_annotation.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/sous_category.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/commodites_model/commodite.dart';

import 'batiment.dart';
import 'commentaire.dart';
import 'count.dart';
import 'horaire.dart';
import 'image.dart';

part 'etablissement.g.dart';

@JsonSerializable()
class Etablissement {
  int? id;
  String? nom;
  @JsonKey(name: 'batiment_id')
  int? batimentId;
  @JsonKey(name: 'indication_adresse')
  String? indicationAdresse;
  @JsonKey(name: 'code_postal')
  String? codePostal;
  @JsonKey(name: 'site_internet')
  String? siteInternet;
  @JsonKey(name: 'nom_manager')
  String? nomManager;
  @JsonKey(name: 'contact_manager')
  String? contactManager;
  @JsonKey(name: 'user_id')
  int? userId;
  int? etage;
  dynamic cover;
  String? phone;
  String? whatsapp1;
  String? whatsapp2;
  String? description;
  @JsonKey(name: 'osm_id')
  dynamic osmId;
  String? services;
  String? ameliorations;
  int? vues;
  dynamic logo;
  @JsonKey(name: 'logo_map')
  dynamic logoMap;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  bool? isFavoris;
  bool? isopen;
  dynamic moyenne;
  int? avis;
  List<Count>? count;
  Batiment? batiment;
  @JsonKey(name: 'sous_categories')
  List<SousCategory>? sousCategories;
  List<Commodite>? commodites;
  List<Image>? images;
  List<Horaire>? horaires;
  List<Commentaire>? commentaires;
  User? user;
  double? distance;

  Etablissement(
      {this.id,
      this.nom,
      this.batimentId,
      this.indicationAdresse,
      this.codePostal,
      this.siteInternet,
      this.nomManager,
      this.contactManager,
      this.userId,
      this.etage,
      this.cover,
      this.phone,
      this.whatsapp1,
      this.whatsapp2,
      this.description,
      this.osmId,
      this.services,
      this.ameliorations,
      this.vues,
      this.logo,
      this.logoMap,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.isFavoris,
      this.isopen,
      this.moyenne,
      this.avis,
      this.count,
      this.batiment,
      this.sousCategories,
      this.commodites,
      this.images,
      this.horaires,
      this.commentaires,
      this.user,
      this.distance});

  @override
  String toString() {
    return 'Etablissement(id: $id, nom: $nom, batimentId: $batimentId, indicationAdresse: $indicationAdresse, codePostal: $codePostal, siteInternet: $siteInternet, nomManager: $nomManager, contactManager: $contactManager, userId: $userId, etage: $etage, cover: $cover, phone: $phone, whatsapp1: $whatsapp1, whatsapp2: $whatsapp2, description: $description, osmId: $osmId, services: $services, ameliorations: $ameliorations, vues: $vues, logo: $logo, logoMap: $logoMap, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, isFavoris: $isFavoris, isopen: $isopen, moyenne: $moyenne, avis: $avis, count: $count, batiment: $batiment, sousCategories: $sousCategories, commodites: $commodites, images: $images, horaires: $horaires, commentaires: $commentaires, user: $user, distance: $distance)';
  }

  factory Etablissement.fromJson(Map<String, dynamic> json) {
    return _$EtablissementFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EtablissementToJson(this);

  Etablissement copyWith(
      {int? id,
      String? nom,
      int? batimentId,
      String? indicationAdresse,
      String? codePostal,
      String? siteInternet,
      String? nomManager,
      String? contactManager,
      int? userId,
      int? etage,
      dynamic cover,
      String? phone,
      String? whatsapp1,
      String? whatsapp2,
      String? description,
      dynamic osmId,
      String? services,
      String? ameliorations,
      int? vues,
      dynamic logo,
      dynamic logoMap,
      dynamic deletedAt,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? isFavoris,
      bool? isopen,
      dynamic moyenne,
      int? avis,
      List<Count>? count,
      Batiment? batiment,
      List<SousCategory>? sousCategories,
      List<Commodite>? commodites,
      List<Image>? images,
      List<Horaire>? horaires,
      List<Commentaire>? commentaires,
      User? user,
      double? distance}) {
    return Etablissement(
        id: id ?? this.id,
        nom: nom ?? this.nom,
        batimentId: batimentId ?? this.batimentId,
        indicationAdresse: indicationAdresse ?? this.indicationAdresse,
        codePostal: codePostal ?? this.codePostal,
        siteInternet: siteInternet ?? this.siteInternet,
        nomManager: nomManager ?? this.nomManager,
        contactManager: contactManager ?? this.contactManager,
        userId: userId ?? this.userId,
        etage: etage ?? this.etage,
        cover: cover ?? this.cover,
        phone: phone ?? this.phone,
        whatsapp1: whatsapp1 ?? this.whatsapp1,
        whatsapp2: whatsapp2 ?? this.whatsapp2,
        description: description ?? this.description,
        osmId: osmId ?? this.osmId,
        services: services ?? this.services,
        ameliorations: ameliorations ?? this.ameliorations,
        vues: vues ?? this.vues,
        logo: logo ?? this.logo,
        logoMap: logoMap ?? this.logoMap,
        deletedAt: deletedAt ?? this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isFavoris: isFavoris ?? this.isFavoris,
        isopen: isopen ?? isopen,
        moyenne: moyenne ?? this.moyenne,
        avis: avis ?? this.avis,
        count: count ?? this.count,
        batiment: batiment ?? this.batiment,
        sousCategories: sousCategories ?? this.sousCategories,
        commodites: commodites ?? this.commodites,
        images: images ?? this.images,
        horaires: horaires ?? this.horaires,
        commentaires: commentaires ?? this.commentaires,
        user: user ?? this.user,
        distance: distance ?? this.distance);
  }
}
