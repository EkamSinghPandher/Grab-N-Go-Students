// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LocationList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    name: json['name'] as String,
    imageURL: json['imageURL'] as String,
    location: Location._fromJsonGeoPoint(json['location'] as GeoPoint),
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'imageURL': instance.imageURL,
      'location': Location._toJsonGeoPoint(instance.location),
    };
