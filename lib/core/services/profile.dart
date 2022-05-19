import 'package:webreg_mobile_flutter/app_networking.dart';
import 'package:webreg_mobile_flutter/core/models/profile.dart';

class ProfileService {
  // TODO(p8gonzal): Note to not use this prototype. For development purposes only.
  final String profilePrototype =
      'https://i4ghbvwuo9.execute-api.us-west-2.amazonaws.com/qa/profile';

  bool _isLoading = false;
  DateTime? _lastUpdated;
  String? _error;
  ProfileModel? profile;

  final NetworkHelper _networkHelper = const NetworkHelper();

  Future<bool> fetchProfile(Map<String, String> headers) async {
    _error = null;
    _isLoading = true;

    try {

      /// Fetch data
      final String? _response =
          await _networkHelper.fetchData(profilePrototype);
      if (_response != null) {
        /// Parse data
        profile = profileModelFromJson(_response);
        _isLoading = false;
      } else {
        _isLoading = false;
        return false;
      }
      return true;
    } catch (e) {
      _error = e.toString();
      print(_error);
      _isLoading = false;
      return false;
    }
  }
}
