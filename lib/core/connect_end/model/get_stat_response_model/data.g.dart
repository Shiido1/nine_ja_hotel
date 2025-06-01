// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  totalBookings: (json['total_bookings'] as num?)?.toInt(),
  todayS: (json["today's"] as num?)?.toInt(),
  totalRoom: (json['total_room'] as num?)?.toInt(),
  totalHall: (json['total_hall'] as num?)?.toInt(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'total_bookings': instance.totalBookings,
  "today's": instance.todayS,
  'total_room': instance.totalRoom,
  'total_hall': instance.totalHall,
};
