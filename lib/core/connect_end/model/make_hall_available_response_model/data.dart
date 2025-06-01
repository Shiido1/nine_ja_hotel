import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? id;
  String? name;
  int? price;
  String? status;
  int? capacity;
  String? description;

  Data({
    this.id,
    this.name,
    this.price,
    this.status,
    this.capacity,
    this.description,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
