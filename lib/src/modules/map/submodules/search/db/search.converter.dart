import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';

class SearchConverter extends TypeConverter<SearchModel, String> {
  const SearchConverter();

  @override
  SearchModel fromSql(String fromDb) {
    return SearchModel.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(SearchModel value) {
    return json.encode(value.toJson());
  }
}
