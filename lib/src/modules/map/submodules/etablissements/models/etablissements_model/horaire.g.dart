// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Horaire _$HoraireFromJson(Map<String, dynamic> json) => Horaire(
      id: json['id'] as int?,
      etablissementId: json['etablissement_id'] as int?,
      jour: json['jour'] as String?,
      plageHoraire: json['plage_horaire'] as String?,
    );

Map<String, dynamic> _$HoraireToJson(Horaire instance) => <String, dynamic>{
      'id': instance.id,
      'etablissement_id': instance.etablissementId,
      'jour': instance.jour,
      'plage_horaire': instance.plageHoraire,
    };
