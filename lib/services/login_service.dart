import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sl_mate/model/login_model.dart';

class LoginService {
  Future<LoginResponceModel> login(LoginRequestModel loginRequestModel) async {
    final url = "https://public-transport-ticketing.herokuapp.com/auth/signin";
    //final url = "https://shopping-backend-api.herokuapp.com/auth/signin";
    Uri _uri = Uri.parse(url);

    print(loginRequestModel);
    final responce = await http.post(
        Uri.parse("https://shopping-backend-api.herokuapp.com/auth/signin"),
        body: loginRequestModel.toJson());

    print(responce.statusCode.toString());
    if (responce.statusCode == 200 || responce.statusCode == 422) {
      return LoginResponceModel.fromJson(jsonDecode(responce.body));
    } else {
      throw Exception("Failed to load Data");
    }
  }
}
