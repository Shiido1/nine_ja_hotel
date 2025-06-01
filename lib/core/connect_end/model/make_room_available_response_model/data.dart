import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? id;
  String? number;
  @JsonKey(name: 'walk_in_price')
  int? walkInPrice;
  @JsonKey(name: 'online_price')
  int? onlinePrice;
  String? type;
  @JsonKey(name: 'is_available')
  bool? isAvailable;
  String? character;
  String? floor;
  @JsonKey(name: 'bed_type')
  String? bedType;
  String? status;
  dynamic image;

  Data({
    this.id,
    this.number,
    this.walkInPrice,
    this.onlinePrice,
    this.type,
    this.isAvailable,
    this.character,
    this.floor,
    this.bedType,
    this.status,
    this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
