import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';

class CategoryConverter extends TypeConverter<Category, String> {
  const CategoryConverter();

  @override
  Category fromSql(String fromDb) {
    return Category.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Category value) {
    return json.encode(value.toJson());
  }
}
