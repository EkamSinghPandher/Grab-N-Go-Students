import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'LocationList.g.dart';

@JsonSerializable()
class Location{
  final String name;
  final String imageURL;

  @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
  GeoPoint location;

  static GeoPoint _fromJsonGeoPoint(GeoPoint geoPoint) {
    return geoPoint;
  }

  static GeoPoint _toJsonGeoPoint(GeoPoint geoPoint) {
    return geoPoint;
  }

  Location({this.name, this.imageURL, this.location});

  factory Location.fromJson(Map<String, dynamic> json) =>_$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}