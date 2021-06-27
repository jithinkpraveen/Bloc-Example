import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:study/properties.dart';
import 'package:study/users/data/userModel.dart';

abstract class UsersRepo {
  Future getUser(String page);
}

class UserServices implements UsersRepo {
  @override
  Future getUser(String page) async {
    try {
      final response = await http
          .get(Uri.parse(Properties.rootUrl + Properties.getUser + page));
      var data = jsonDecode(response.body)['data'] as List;

      List<UserModel> users = [];

      data.forEach((element) {
        users.add(UserModel.fromJsonn(element));
      });

      return users;
    } catch (e) {
      print(e);

      return false;
    }
  }
}
