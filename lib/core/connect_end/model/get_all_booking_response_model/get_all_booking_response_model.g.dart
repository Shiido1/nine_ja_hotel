// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_booking_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBookingResponseModel _$GetAllBookingResponseModelFromJson(
  Map<String, dynamic> json,
) => GetAllBookingResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
  meta:
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
  links:
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetAllBookingResponseModelToJson(
  GetAllBookingResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
  'links': instance.links,
};
