import 'package:json_annotation/json_annotation.dart';

part 'Student.g.dart';

@JsonSerializable()
class Student{
  final String uid;
  final String email;
  final String currLoc;

  Student({this.uid, this.email, this.currLoc});

  factory Student.fromJson(Map<String, dynamic> json) =>_$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}