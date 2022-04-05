import 'package:webreg_mobile_flutter/core/models/authentication.dart';

import '../../app_networking.dart';

class AuthenticationService {
  AuthenticationService();
  String? error;
  AuthenticationModel? _data;
  DateTime? _lastUpdated;

  final NetworkHelper _networkHelper = NetworkHelper();


  
}
