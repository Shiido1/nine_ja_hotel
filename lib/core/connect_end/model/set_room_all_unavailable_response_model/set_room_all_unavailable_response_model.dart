import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'set_room_all_unavailable_response_model.g.dart';

@JsonSerializable()
class SetRoomAllUnavailableResponseModel {
  bool? success;
  String? message;
  Data? data;

  SetRoomAllUnavailableResponseModel({this.success, this.message, this.data});

  factory SetRoomAllUnavailableResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$SetRoomAllUnavailableResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SetRoomAllUnavailableResponseModelToJson(this);
  }
}
