class LoginResponceModel {
  final String accessToken;

  LoginResponceModel({required this.accessToken});

  factory LoginResponceModel.fromJson(Map<String, dynamic> json) {
    return LoginResponceModel(
        accessToken: json["accessToken"] != null ? json["accessToken"] : "");
  }
}

class LoginRequestModel {
  String username;
  String password;

  LoginRequestModel({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userName': username.trim(),
      'password': password.trim(),
    };
    return map;
  }
}
