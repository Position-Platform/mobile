import 'package:json_annotation/json_annotation.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/commentaire.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Commentaire? commentaire;

  Data({this.commentaire});

  @override
  String toString() => 'Data(commentaire: $commentaire)';

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    Commentaire? commentaire,
  }) {
    return Data(
      commentaire: commentaire ?? this.commentaire,
    );
  }
}
