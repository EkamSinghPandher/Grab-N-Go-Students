// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
    text: json['text'] as String,
    studentID: json['studentID'] as String,
    vendorID: json['vendorID'] as String,
    sendorID: json['sendorID'] as String,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'text': instance.text,
      'studentID': instance.studentID,
      'vendorID': instance.vendorID,
      'sendorID': instance.sendorID,
      'time': instance.time?.toIso8601String(),
    };
