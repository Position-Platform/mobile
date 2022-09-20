import 'package:json_annotation/json_annotation.dart';

part 'favorite.g.dart';

@JsonSerializable()
class Favorite {
  @JsonKey(name: 'etablissement_id')
  int? etablissementId;
  @JsonKey(name: 'user_id')
  int? userId;
  int? id;

  Favorite({this.etablissementId, this.userId, this.id});

  @override
  String toString() {
    return 'Favorite(etablissementId: $etablissementId, userId: $userId, id: $id)';
  }

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return _$FavoriteFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FavoriteToJson(this);

  Favorite copyWith({
    int? etablissementId,
    int? userId,
    int? id,
  }) {
    return Favorite(
      etablissementId: etablissementId ?? this.etablissementId,
      userId: userId ?? this.userId,
      id: id ?? this.id,
    );
  }
}
