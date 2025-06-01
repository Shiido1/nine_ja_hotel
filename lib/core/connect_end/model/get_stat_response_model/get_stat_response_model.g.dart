// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_stat_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStatResponseModel _$GetStatResponseModelFromJson(
  Map<String, dynamic> json,
) => GetStatResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetStatResponseModelToJson(
  GetStatResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
