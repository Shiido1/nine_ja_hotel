import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'total_bookings')
  int? totalBookings;
  @JsonKey(name: "todays")
  int? todayS;
  @JsonKey(name: 'total_room')
  int? totalRoom;
  @JsonKey(name: 'total_hall')
  int? totalHall;

  Data({this.totalBookings, this.todayS, this.totalRoom, this.totalHall});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
