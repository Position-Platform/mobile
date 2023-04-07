import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  int? id;
  @JsonKey(name: 'etablissement_id')
  int? etablissementId;
  @JsonKey(name: 'image_url')
  String? imageUrl;

  Image({this.id, this.etablissementId, this.imageUrl});

  @override
  String toString() {
    return 'Image(id: $id, etablissementId: $etablissementId, imageUrl: $imageUrl)';
  }

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);

  Image copyWith({
    int? id,
    int? etablissementId,
    String? imageUrl,
  }) {
    return Image(
      id: id ?? this.id,
      etablissementId: etablissementId ?? this.etablissementId,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
