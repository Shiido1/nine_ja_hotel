import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? username;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  dynamic avatar;
  @JsonKey(name: 'hotel_code')
  dynamic hotelCode;

  User({
    this.id,
    this.username,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.avatar,
    this.hotelCode,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
