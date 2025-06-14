// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_halls_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllHallsResponseModel _$GetAllHallsResponseModelFromJson(
  Map<String, dynamic> json,
) => GetAllHallsResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetAllHallsResponseModelToJson(
  GetAllHallsResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
