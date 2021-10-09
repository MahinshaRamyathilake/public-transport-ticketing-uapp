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
      Uri.parse("https://public-transport-ticketing.herokuapp.com/auth/signin"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userName': loginRequestModel.userName,
        'password': loginRequestModel.password
      }),
    );
    print(jsonDecode(responce.body));
    if (responce.statusCode == 201 ||
        responce.statusCode == 401 ||
        responce.statusCode == 422) {
      return LoginResponceModel.fromJson(jsonDecode(responce.body));
    } else {
      throw Exception("Failed to load Data");
    }
  }
}
