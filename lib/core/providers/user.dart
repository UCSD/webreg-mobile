import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  String? accessToken = '';

  set setToken(String? token) {
    accessToken = token;
  }

  String? get getToken {
    return accessToken;
  }
}
