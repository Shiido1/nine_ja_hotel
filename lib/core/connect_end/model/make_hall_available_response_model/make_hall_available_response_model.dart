import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'make_hall_available_response_model.g.dart';

@JsonSerializable()
class MakeHallAvailableResponseModel {
  bool? success;
  String? message;
  Data? data;

  MakeHallAvailableResponseModel({this.success, this.message, this.data});

  factory MakeHallAvailableResponseModel.fromJson(Map<String, dynamic> json) {
    return _$MakeHallAvailableResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MakeHallAvailableResponseModelToJson(this);
  }
}
