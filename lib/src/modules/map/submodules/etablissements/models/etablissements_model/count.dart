import 'package:json_annotation/json_annotation.dart';

part 'count.g.dart';

@JsonSerializable()
class Count {
  int? count;
  int? rating;

  Count({this.count, this.rating});

  @override
  String toString() => 'Count(count: $count, rating: $rating)';

  factory Count.fromJson(Map<String, dynamic> json) => _$CountFromJson(json);

  Map<String, dynamic> toJson() => _$CountToJson(this);

  Count copyWith({
    int? count,
    int? rating,
  }) {
    return Count(
      count: count ?? this.count,
      rating: rating ?? this.rating,
    );
  }
}
