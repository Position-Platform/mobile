// ignore_for_file: constant_identifier_names, prefer_null_aware_operators

import 'dart:convert';

Routing routingFromJson(String str) => Routing.fromJson(json.decode(str));

String routingToJson(Routing data) => json.encode(data.toJson());

class Routing {
  Routing({
    this.code,
    this.routes,
    this.waypoints,
  });

  String? code;
  List<Route>? routes;
  List<Waypoint>? waypoints;

  factory Routing.fromJson(Map<String, dynamic> json) => Routing(
        code: json["code"],
        routes: json["routes"] == null
            ? null
            : List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
        waypoints: json["waypoints"] == null
            ? null
            : List<Waypoint>.from(
                json["waypoints"].map((x) => Waypoint.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "routes": routes == null
            ? null
            : List<dynamic>.from(routes!.map((x) => x.toJson())),
        "waypoints": waypoints == null
            ? null
            : List<dynamic>.from(waypoints!.map((x) => x.toJson())),
      };
}

class Route {
  Route({
    this.geometry,
    this.legs,
    this.weightName,
    this.weight,
    this.duration,
    this.distance,
  });

  Geometry? geometry;
  List<Leg>? legs;
  String? weightName;
  double? weight;
  double? duration;
  double? distance;

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromJson(json["geometry"]),
        legs: json["legs"] == null
            ? null
            : List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
        weightName: json["weight_name"],
        weight: json["weight"] == null ? null : json["weight"].toDouble(),
        duration: json["duration"] == null ? null : json["duration"].toDouble(),
        distance: json["distance"] == null ? null : json["distance"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "geometry": geometry == null ? null : geometry!.toJson(),
        "legs": legs == null
            ? null
            : List<dynamic>.from(legs!.map((x) => x.toJson())),
        "weight_name": weightName,
        "weight": weight,
        "duration": duration,
        "distance": distance,
      };
}

class Geometry {
  Geometry({
    this.coordinates,
    this.type,
  });

  List<List<double>>? coordinates;
  Type? type;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        coordinates: json["coordinates"] == null
            ? null
            : List<List<double>>.from(json["coordinates"]
                .map((x) => List<double>.from(x.map((x) => x.toDouble())))),
        type: json["type"] == null ? null : typeValues.map![json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": coordinates == null
            ? null
            : List<dynamic>.from(
                coordinates!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "type": type == null ? null : typeValues.reverse![type],
      };
}

enum Type { LINE_STRING }

final typeValues = EnumValues({"LineString": Type.LINE_STRING});

class Leg {
  Leg({
    this.steps,
    this.summary,
    this.weight,
    this.duration,
    this.distance,
  });

  List<Step>? steps;
  String? summary;
  double? weight;
  double? duration;
  double? distance;

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        steps: json["steps"] == null
            ? null
            : List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
        summary: json["summary"],
        weight: json["weight"] == null ? null : json["weight"].toDouble(),
        duration: json["duration"] == null ? null : json["duration"].toDouble(),
        distance: json["distance"] == null ? null : json["distance"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "steps": steps == null
            ? null
            : List<dynamic>.from(steps!.map((x) => x.toJson())),
        "summary": summary,
        "weight": weight,
        "duration": duration,
        "distance": distance,
      };
}

class Step {
  Step({
    this.geometry,
    this.maneuver,
    this.mode,
    this.drivingSide,
    this.name,
    this.intersections,
    this.weight,
    this.duration,
    this.distance,
  });

  Geometry? geometry;
  Maneuver? maneuver;
  Mode? mode;
  DrivingSide? drivingSide;
  String? name;
  List<Intersection>? intersections;
  double? weight;
  double? duration;
  double? distance;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromJson(json["geometry"]),
        maneuver: json["maneuver"] == null
            ? null
            : Maneuver.fromJson(json["maneuver"]),
        mode: json["mode"] == null ? null : modeValues.map![json["mode"]],
        drivingSide: json["driving_side"] == null
            ? null
            : drivingSideValues.map![json["driving_side"]],
        name: json["name"],
        intersections: json["intersections"] == null
            ? null
            : List<Intersection>.from(
                json["intersections"].map((x) => Intersection.fromJson(x))),
        weight: json["weight"] == null ? null : json["weight"].toDouble(),
        duration: json["duration"] == null ? null : json["duration"].toDouble(),
        distance: json["distance"] == null ? null : json["distance"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "geometry": geometry == null ? null : geometry!.toJson(),
        "maneuver": maneuver == null ? null : maneuver!.toJson(),
        "mode": mode == null ? null : modeValues.reverse![mode],
        "driving_side": drivingSide == null
            ? null
            : drivingSideValues.reverse![drivingSide],
        "name": name,
        "intersections": intersections == null
            ? null
            : List<dynamic>.from(intersections!.map((x) => x.toJson())),
        "weight": weight,
        "duration": duration,
        "distance": distance,
      };
}

enum DrivingSide { RIGHT, NONE, LEFT, STRAIGHT }

final drivingSideValues = EnumValues({
  "left": DrivingSide.LEFT,
  "none": DrivingSide.NONE,
  "right": DrivingSide.RIGHT,
  "straight": DrivingSide.STRAIGHT
});

class Intersection {
  Intersection({
    this.out,
    this.entry,
    this.bearings,
    this.location,
    this.intersectionIn,
    this.lanes,
  });

  int? out;
  List<bool>? entry;
  List<int>? bearings;
  List<double>? location;
  int? intersectionIn;
  List<Lane>? lanes;

  factory Intersection.fromJson(Map<String, dynamic> json) => Intersection(
        out: json["out"],
        entry: json["entry"] == null
            ? null
            : List<bool>.from(json["entry"].map((x) => x)),
        bearings: json["bearings"] == null
            ? null
            : List<int>.from(json["bearings"].map((x) => x)),
        location: json["location"] == null
            ? null
            : List<double>.from(json["location"].map((x) => x.toDouble())),
        intersectionIn: json["in"],
        lanes: json["lanes"] == null
            ? null
            : List<Lane>.from(json["lanes"].map((x) => Lane.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "out": out,
        "entry":
            entry == null ? null : List<dynamic>.from(entry!.map((x) => x)),
        "bearings": bearings == null
            ? null
            : List<dynamic>.from(bearings!.map((x) => x)),
        "location": location == null
            ? null
            : List<dynamic>.from(location!.map((x) => x)),
        "in": intersectionIn,
        "lanes": lanes == null
            ? null
            : List<dynamic>.from(lanes!.map((x) => x.toJson())),
      };
}

class Lane {
  Lane({
    this.valid,
    this.indications,
  });

  bool? valid;
  List<DrivingSide>? indications;

  factory Lane.fromJson(Map<String, dynamic> json) => Lane(
        valid: json["valid"],
        indications: json["indications"] == null
            ? null
            : List<DrivingSide>.from(
                json["indications"].map((x) => drivingSideValues.map![x])),
      );

  Map<String, dynamic> toJson() => {
        "valid": valid,
        "indications": indications == null
            ? null
            : List<dynamic>.from(
                indications!.map((x) => drivingSideValues.reverse![x])),
      };
}

class Maneuver {
  Maneuver({
    this.bearingAfter,
    this.bearingBefore,
    this.location,
    this.type,
    this.modifier,
  });

  int? bearingAfter;
  int? bearingBefore;
  List<double>? location;
  String? type;
  DrivingSide? modifier;

  factory Maneuver.fromJson(Map<String, dynamic> json) => Maneuver(
        bearingAfter: json["bearing_after"],
        bearingBefore: json["bearing_before"],
        location: json["location"] == null
            ? null
            : List<double>.from(json["location"].map((x) => x.toDouble())),
        type: json["type"],
        modifier: json["modifier"] == null
            ? null
            : drivingSideValues.map![json["modifier"]],
      );

  Map<String, dynamic> toJson() => {
        "bearing_after": bearingAfter,
        "bearing_before": bearingBefore,
        "location": location == null
            ? null
            : List<dynamic>.from(location!.map((x) => x)),
        "type": type,
        "modifier":
            modifier == null ? null : drivingSideValues.reverse![modifier],
      };
}

enum Mode { DRIVING }

final modeValues = EnumValues({"driving": Mode.DRIVING});

class Waypoint {
  Waypoint({
    this.hint,
    this.distance,
    this.name,
    this.location,
  });

  String? hint;
  double? distance;
  String? name;
  List<double>? location;

  factory Waypoint.fromJson(Map<String, dynamic> json) => Waypoint(
        hint: json["hint"],
        distance: json["distance"] == null ? null : json["distance"].toDouble(),
        name: json["name"],
        location: json["location"] == null
            ? null
            : List<double>.from(json["location"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "hint": hint,
        "distance": distance,
        "name": name,
        "location": location == null
            ? null
            : List<dynamic>.from(location!.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
