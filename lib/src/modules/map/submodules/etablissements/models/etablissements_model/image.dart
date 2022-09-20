import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  int? id;
  @JsonKey(name: 'etablissement_id')
  int? etablissementId;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  Image({
    this.id,
    this.etablissementId,
    this.imageUrl,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Image(id: $id, etablissementId: $etablissementId, imageUrl: $imageUrl, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);

  Image copyWith({
    int? id,
    int? etablissementId,
    String? imageUrl,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Image(
      id: id ?? this.id,
      etablissementId: etablissementId ?? this.etablissementId,
      imageUrl: imageUrl ?? this.imageUrl,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
