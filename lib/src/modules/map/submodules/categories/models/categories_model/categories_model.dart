import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
	bool? success;
	Data? data;
	String? message;

	CategoriesModel({this.success, this.data, this.message});

	@override
	String toString() {
		return 'CategoriesModel(success: $success, data: $data, message: $message)';
	}

	factory CategoriesModel.fromJson(Map<String, dynamic> json) {
		return _$CategoriesModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);

	CategoriesModel copyWith({
		bool? success,
		Data? data,
		String? message,
	}) {
		return CategoriesModel(
			success: success ?? this.success,
			data: data ?? this.data,
			message: message ?? this.message,
		);
	}
}
