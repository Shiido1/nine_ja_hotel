// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hall _$HallFromJson(Map<String, dynamic> json) => Hall(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  price: (json['price'] as num?)?.toInt(),
  status: json['status'] as String?,
  capacity: (json['capacity'] as num?)?.toInt(),
  description: json['description'] as String?,
  iamge: json['iamge'],
);

Map<String, dynamic> _$HallToJson(Hall instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price': instance.price,
  'status': instance.status,
  'capacity': instance.capacity,
  'description': instance.description,
  'iamge': instance.iamge,
};
