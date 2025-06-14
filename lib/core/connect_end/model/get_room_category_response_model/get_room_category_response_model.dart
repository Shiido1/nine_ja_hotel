import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_room_category_response_model.g.dart';

@JsonSerializable()
class GetRoomCategoryResponseModel {
  bool? success;
  String? message;
  List<Datum>? data;

  GetRoomCategoryResponseModel({this.success, this.message, this.data});

  factory GetRoomCategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetRoomCategoryResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetRoomCategoryResponseModelToJson(this);
}
