import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:study/properties.dart';

abstract class AuthRepo {
  Future login(String username, String password);
}

class LoginServices implements AuthRepo {
  @override
  Future login(String username, String password) async {
    print(username);
    print(password);
    try {
      // final response =
      //     await http.post(Uri.parse("https://qa.embase.in/backend/api/"),
      //         body: jsonEncode({
      //           "email": username.toString(),
      //           "password": password.toString(),
      //         }));

      final response = await http.post(
        Uri.parse("https://qa.embase.in/backend/api/embase-login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String?>{
          'email': username,
          'password': password,
          'user_type': '1'
        }),
      );
      log(response.body);
      return jsonDecode(response.body);
    } catch (e) {
      return false;
    }
  }
}
