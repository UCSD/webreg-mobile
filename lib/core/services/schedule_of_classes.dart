import 'dart:async';

import 'package:webreg_mobile_flutter/app_networking.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';
import 'package:webreg_mobile_flutter/core/providers/user.dart';

class ScheduleOfClassesService {
  bool _isLoading = false;
  DateTime? _lastUpdated;
  String? _error;
  ScheduleOfClassesModel? classes;
  UserDataProvider? userDataProvider = UserDataProvider();

  final NetworkHelper _networkHelper = const NetworkHelper();

  final String baseEndpoint =
      'https://api-qa.ucsd.edu:8243/get_schedule_of_classes/v1/classes/search';

  Future<bool> fetchClasses(Map<String, String> headers, String query) async {
    _error = null;
    _isLoading = true;
    try {
      //await getNewToken();

      /// fetch data
      final String? _response = await _networkHelper.authorizedFetch(
          baseEndpoint + '?' + query, headers);
      if (_response != null) {
        final ScheduleOfClassesModel data =
            classScheduleModelFromJson(_response);
        classes = data;
      } else {
        /// parse data

        return false;
      }
      _isLoading = false;
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      return false;
    }
  }

  bool get isLoading => _isLoading;

  String? get error => _error;

  DateTime? get lastUpdated => _lastUpdated;
}
