class SetUnavailableEntityModel {
  String? from;
  String? to;

  SetUnavailableEntityModel({this.from, this.to});

  factory SetUnavailableEntityModel.fromJson(Map<String, dynamic> json) {
    return SetUnavailableEntityModel(
      from: json['from'] as String?,
      to: json['to'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'from': from, 'to': to};
}
