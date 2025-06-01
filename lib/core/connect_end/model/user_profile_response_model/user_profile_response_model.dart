import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'user_profile_response_model.g.dart';

@JsonSerializable()
class UserProfileResponseModel {
  bool? success;
  String? message;
  Data? data;

  UserProfileResponseModel({this.success, this.message, this.data});

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UserProfileResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserProfileResponseModelToJson(this);
}
