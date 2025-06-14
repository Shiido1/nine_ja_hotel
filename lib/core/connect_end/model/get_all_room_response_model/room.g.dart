// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
  id: (json['id'] as num?)?.toInt(),
  number: json['number'] as String?,
  walkInPrice: (json['walk_in_price'] as num?)?.toInt(),
  onlinePrice: (json['online_price'] as num?)?.toInt(),
  type: json['type'] as String?,
  isAvailable: json['is_available'] as String?,
  character: json['character'] as String?,
  floor: json['floor'] as String?,
  bedType: json['bed_type'] as String?,
  status: json['status'] as String?,
  image: json['image'],
);

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
  'id': instance.id,
  'number': instance.number,
  'walk_in_price': instance.walkInPrice,
  'online_price': instance.onlinePrice,
  'type': instance.type,
  'is_available': instance.isAvailable,
  'character': instance.character,
  'floor': instance.floor,
  'bed_type': instance.bedType,
  'status': instance.status,
  'image': instance.image,
};
