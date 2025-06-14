// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_room_category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRoomCategoryResponseModel _$GetRoomCategoryResponseModelFromJson(
  Map<String, dynamic> json,
) => GetRoomCategoryResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$GetRoomCategoryResponseModelToJson(
  GetRoomCategoryResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
