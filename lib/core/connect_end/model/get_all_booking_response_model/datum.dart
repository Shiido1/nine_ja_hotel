import 'package:json_annotation/json_annotation.dart';

import 'customer.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  String? reference;
  @JsonKey(name: 'booking_type')
  String? bookingType;
  @JsonKey(name: 'Booked Item')
  String? bookedItem;
  @JsonKey(name: 'amount_paid')
  int? amountPaid;
  @JsonKey(name: 'commission_amount')
  int? commissionAmount;
  @JsonKey(name: 'hotel_payable')
  int? hotelPayable;
  @JsonKey(name: 'checked_in')
  String? checkedIn;
  @JsonKey(name: 'checked_out')
  String? checkedOut;
  String? status;
  Customer? customer;

  Datum({
    this.id,
    this.reference,
    this.bookingType,
    this.bookedItem,
    this.amountPaid,
    this.commissionAmount,
    this.hotelPayable,
    this.checkedIn,
    this.checkedOut,
    this.status,
    this.customer,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
