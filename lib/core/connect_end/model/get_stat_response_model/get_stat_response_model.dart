import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_stat_response_model.g.dart';

@JsonSerializable()
class GetStatResponseModel {
  bool? success;
  String? message;
  Data? data;

  GetStatResponseModel({this.success, this.message, this.data});

  factory GetStatResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetStatResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetStatResponseModelToJson(this);
}
