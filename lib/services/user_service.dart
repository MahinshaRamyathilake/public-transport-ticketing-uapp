import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sl_mate/model/login_model.dart';
import 'package:sl_mate/model/user_model.dart';

class UserService {
  Future<User> getUserDetails(String userName) async {
    final response = await http.get(Uri.parse(
        'https://public-transport-ticketing.herokuapp.com/auth/username/'+userName));
    print(response);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load users');
    }
  }
}
