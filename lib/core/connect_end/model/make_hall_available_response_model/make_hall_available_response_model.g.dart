// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_hall_available_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeHallAvailableResponseModel _$MakeHallAvailableResponseModelFromJson(
  Map<String, dynamic> json,
) => MakeHallAvailableResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MakeHallAvailableResponseModelToJson(
  MakeHallAvailableResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
