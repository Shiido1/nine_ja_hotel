// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_room_all_unavailable_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetRoomAllUnavailableResponseModel _$SetRoomAllUnavailableResponseModelFromJson(
        Map<String, dynamic> json) =>
    SetRoomAllUnavailableResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SetRoomAllUnavailableResponseModelToJson(
        SetRoomAllUnavailableResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
