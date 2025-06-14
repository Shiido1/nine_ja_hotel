import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class Room {
  int? id;
  String? number;
  @JsonKey(name: 'walk_in_price')
  int? walkInPrice;
  @JsonKey(name: 'online_price')
  int? onlinePrice;
  String? type;
  @JsonKey(name: 'is_available')
  String? isAvailable;
  String? character;
  String? floor;
  @JsonKey(name: 'bed_type')
  String? bedType;
  String? status;
  dynamic image;

  Room({
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

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
