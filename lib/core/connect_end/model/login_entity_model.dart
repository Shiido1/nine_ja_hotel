class LoginEntityModel {
  String? email;
  String? password;

  LoginEntityModel({this.email, this.password});

  factory LoginEntityModel.fromJson(Map<String, dynamic> json) {
    return LoginEntityModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
