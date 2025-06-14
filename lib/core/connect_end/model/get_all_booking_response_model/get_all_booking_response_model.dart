import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'links.dart';
import 'meta.dart';

part 'get_all_booking_response_model.g.dart';

@JsonSerializable()
class GetAllBookingResponseModel {
  bool? success;
  String? message;
  List<Datum>? data;
  Meta? meta;
  Links? links;

  GetAllBookingResponseModel({
    this.success,
    this.message,
    this.data,
    this.meta,
    this.links,
  });

  factory GetAllBookingResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllBookingResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllBookingResponseModelToJson(this);
}
