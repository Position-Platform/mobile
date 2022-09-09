import 'package:json_annotation/json_annotation.dart';

import 'category.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Category>? categories;

  Data({this.categories});

  @override
  String toString() => 'Data(categories: $categories)';

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    List<Category>? categories,
  }) {
    return Data(
      categories: categories ?? this.categories,
    );
  }
}
