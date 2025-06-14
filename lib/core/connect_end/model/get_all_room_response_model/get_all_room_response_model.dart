import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_all_room_response_model.g.dart';

@JsonSerializable()
class GetAllRoomResponseModel {
  bool? success;
  String? message;
  Data? data;

  GetAllRoomResponseModel({this.success, this.message, this.data});

  factory GetAllRoomResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllRoomResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllRoomResponseModelToJson(this);
}
