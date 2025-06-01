import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'make_room_available_response_model.g.dart';

@JsonSerializable()
class MakeRoomAvailableResponseModel {
  bool? success;
  String? message;
  Data? data;

  MakeRoomAvailableResponseModel({this.success, this.message, this.data});

  factory MakeRoomAvailableResponseModel.fromJson(Map<String, dynamic> json) {
    return _$MakeRoomAvailableResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MakeRoomAvailableResponseModelToJson(this);
  }
}
