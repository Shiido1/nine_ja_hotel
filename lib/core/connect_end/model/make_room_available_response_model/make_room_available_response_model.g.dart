// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_room_available_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeRoomAvailableResponseModel _$MakeRoomAvailableResponseModelFromJson(
  Map<String, dynamic> json,
) => MakeRoomAvailableResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MakeRoomAvailableResponseModelToJson(
  MakeRoomAvailableResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
