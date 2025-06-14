// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_room_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllRoomResponseModel _$GetAllRoomResponseModelFromJson(
  Map<String, dynamic> json,
) => GetAllRoomResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetAllRoomResponseModelToJson(
  GetAllRoomResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
