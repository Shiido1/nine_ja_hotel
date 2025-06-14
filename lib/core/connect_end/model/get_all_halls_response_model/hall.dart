import 'package:json_annotation/json_annotation.dart';

part 'hall.g.dart';

@JsonSerializable()
class Hall {
  int? id;
  String? name;
  int? price;
  String? status;
  int? capacity;
  String? description;
  dynamic iamge;

  Hall({
    this.id,
    this.name,
    this.price,
    this.status,
    this.capacity,
    this.description,
    this.iamge,
  });

  factory Hall.fromJson(Map<String, dynamic> json) => _$HallFromJson(json);

  Map<String, dynamic> toJson() => _$HallToJson(this);
}
