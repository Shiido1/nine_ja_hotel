import 'package:json_annotation/json_annotation.dart';

import 'hall.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Hall>? halls;

  Data({this.halls});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
