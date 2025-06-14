// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
  id: (json['id'] as num?)?.toInt(),
  reference: json['reference'] as String?,
  bookingType: json['booking_type'] as String?,
  bookedItem: json['Booked Item'] as String?,
  amountPaid: (json['amount_paid'] as num?)?.toInt(),
  commissionAmount: (json['commission_amount'] as num?)?.toInt(),
  hotelPayable: (json['hotel_payable'] as num?)?.toInt(),
  checkedIn: json['checked_in'] as String?,
  checkedOut: json['checked_out'] as String?,
  status: json['status'] as String?,
  customer:
      json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
  'id': instance.id,
  'reference': instance.reference,
  'booking_type': instance.bookingType,
  'Booked Item': instance.bookedItem,
  'amount_paid': instance.amountPaid,
  'commission_amount': instance.commissionAmount,
  'hotel_payable': instance.hotelPayable,
  'checked_in': instance.checkedIn,
  'checked_out': instance.checkedOut,
  'status': instance.status,
  'customer': instance.customer,
};
