import 'dart:async';

import 'package:webreg_mobile_flutter/app_networking.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';

class ScheduleOfClassesService {
  bool _isLoading = false;
  DateTime? _lastUpdated;
  String? _error;
  ScheduleOfClassesModel? classes;
  final NetworkHelper _networkHelper = const NetworkHelper();
  final Map<String, String> headers = {
    'accept': 'application/json',
  };
  final String baseEndpoint =
      'https://api-qa.ucsd.edu:8243/get_schedule_of_classes/v1/classes/search';

  Future<bool> fetchClasses(String query) async {
    _error = null;
    _isLoading = true;
    try {
      await getNewToken();

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

  Future<bool> getNewToken() async {
    // TODO(p8gonzal): Have subscription set up for webreg mobile. Investigate alternatives to Dio.
    try {
      // var response = await _networkHelper.authorizedPost(
      //     tokenEndpoint, tokenHeaders, "grant_type=client_credentials");
      // TODO(p8gonzal): Insert your own authenitcation token for demo. Will be replaced by application credentials
      headers['Authorization'] = 'Bearer ';
      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    }
  }
}
