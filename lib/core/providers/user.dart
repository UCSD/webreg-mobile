import 'dart:convert';
import 'dart:typed_data' show Uint8List;

import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:pointycastle/asymmetric/oaep.dart';
import 'package:pointycastle/pointycastle.dart' as pc;

class UserDataProvider extends ChangeNotifier {
  String? accessToken = '';

  set setToken(String? token) {
    accessToken = token;
    notifyListeners();
  }

  String? get getToken {
    return accessToken;
  }
}
