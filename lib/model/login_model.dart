class LoginResponceModel {
  final String accessToken;
  final String username;
  final String email;
  final String id;

  LoginResponceModel(
      {required this.accessToken,
      required this.username,
      required this.email,
      required this.id});

  factory LoginResponceModel.fromJson(Map<String, dynamic> json) {
    return LoginResponceModel(
        accessToken: json["accessToken"] != null ? json["accessToken"] : "",
        username: json["username"],
        email: json["email"],
        id: json["id"]);
  }
}

class LoginRequestModel {
  String userName;
  String password;

  LoginRequestModel({required this.userName, required this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {'userName': userName, 'password': password};
    return map;
  }
}
