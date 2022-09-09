import 'package:json_annotation/json_annotation.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Category? categorie;

  Data({this.categorie});

  @override
  String toString() => 'Data(categorie: $categorie)';

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    Category? categorie,
  }) {
    return Data(
      categorie: categorie ?? this.categorie,
    );
  }
}
