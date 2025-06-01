import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? id;
  String? username;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  dynamic avatar;
  @JsonKey(name: 'hotel_code')
  dynamic hotelCode;

  Data({
    this.id,
    this.username,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.avatar,
    this.hotelCode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
