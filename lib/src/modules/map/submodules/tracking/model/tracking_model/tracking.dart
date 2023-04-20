import 'package:json_annotation/json_annotation.dart';

part 'tracking.g.dart';

@JsonSerializable()
class Tracking {
  String? longitude;
  String? latitude;
  String? speed;
  String? timestamp;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  int? id;

  Tracking({
    this.longitude,
    this.latitude,
    this.speed,
    this.timestamp,
    this.userId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  @override
  String toString() {
    return 'Tracking(longitude: $longitude, latitude: $latitude, speed: $speed,timestamp:$timestamp, userId: $userId, updatedAt: $updatedAt, createdAt: $createdAt, id: $id)';
  }

  factory Tracking.fromJson(Map<String, dynamic> json) {
    return _$TrackingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TrackingToJson(this);

  Tracking copyWith({
    String? longitude,
    String? latitude,
    String? speed,
    String? timestamp,
    int? userId,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) {
    return Tracking(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      speed: speed ?? this.speed,
      timestamp: timestamp ?? this.timestamp,
      userId: userId ?? this.userId,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }
}
