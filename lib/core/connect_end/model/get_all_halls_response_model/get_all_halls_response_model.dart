import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_all_halls_response_model.g.dart';

@JsonSerializable()
class GetAllHallsResponseModel {
  bool? success;
  String? message;
  Data? data;

  GetAllHallsResponseModel({this.success, this.message, this.data});

  factory GetAllHallsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllHallsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllHallsResponseModelToJson(this);
}
