// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    time: DateTime.fromMillisecondsSinceEpoch(int.parse(json['time']),
        isUtc: true),
    text: json['text'] as String,
    studentID: json['studentID'] as String,
    vendorID: json['vendorID'] as String,
    sendorID: json['sendorID'] as String,
    studName: json['studName'] as String,
    stallName: json['stallName'] as String,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'text': instance.text,
      'studentID': instance.studentID,
      'vendorID': instance.vendorID,
      'sendorID': instance.sendorID,
      'time': instance.time.toUtc().millisecondsSinceEpoch.toString(),
      'stallName': instance.stallName,
      'studName': instance.studName
    };
