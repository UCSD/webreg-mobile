import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/core/models/profile.dart';
import 'package:webreg_mobile_flutter/core/providers/user.dart';
import 'package:webreg_mobile_flutter/core/services/profile.dart';
import 'package:webreg_mobile_flutter/core/services/profile.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileProvider() {
    /// Default States
    _isLoading = false;
    _noResults = false;

    /// Services initialized
    _profileService = ProfileService();

    /// Models initalized
    _profileModel = ProfileModel();
  }

  /// STATES
  bool? _isLoading;
  DateTime? _lastUpdated;
  String? _error;
  bool? _noResults;

  /// MODELS
  ProfileModel _profileModel = ProfileModel();

  /// SERVICES
  late ProfileService _profileService;

  late UserDataProvider _userDataProvider;

  set userDataProvider(UserDataProvider userDataProvider) {
    _userDataProvider = userDataProvider;
  }

  ProfileService get profileService => _profileService;

  Future<bool> fetchProfile() async {
    final Map<String, String> headers = <String, String>{
      'Authorization': 'Bearer ${_userDataProvider.accessToken}'
    };

    return _profileService.fetchProfile(headers);
  }

  /// SIMPLE GETTERS
  bool? get isLoading => _isLoading;
  String? get error => _error;
  DateTime? get lastUpdated => _lastUpdated;
  ProfileModel get profileModel => _profileModel;
  bool? get noResults => _noResults;
}
