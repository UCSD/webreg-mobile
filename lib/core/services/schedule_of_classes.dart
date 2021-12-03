import 'dart:async';

import 'package:webreg_mobile_flutter/app_networking.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';

class ScheduleOfClassesService {
  bool _isLoading = false;
  DateTime? _lastUpdated;
  String? _error;
  List<ScheduleOfClassesModel> _classes = [];
  final NetworkHelper _networkHelper = NetworkHelper();

  final String baseEndpoint =
      "https://api-qa.ucsd.edu:8243/get_schedule_of_classes/v1/";

  Future<bool> fetchClasses(String query) async {
    _error = null;
    _isLoading = true;
    try {
      /// fetch data
      String? _response = await _networkHelper
          .fetchData(baseEndpoint + "?" + query); //add parameters here
      if (_response != null) {
        final ScheduleOfClassesModel data =
            scheduleOfClassesModelFromJson(_response);
        _classes = data as List<ScheduleOfClassesModel>;
      } else {
        /// parse data
        _classes = [];

        return false;
      }
      _isLoading = false;
      return true;
    } catch (e) {
      /// if the authorized fetch failed we know we have to refresh the
      /// token for this service
      print("IN CATCH");
      // if (e.toString().contains("401")) {
      //   print("Getting new token from fetchLocations");
      //   if (await getNewToken()) {
      //     print("Getting new token from fetchLocations");
      //     return await fetchClasses();
      //   }
      // }
      _error = e.toString();
      print(_error);
      _isLoading = false;
      return false;
    }
  }

  // Future<bool> getNewToken() async {
  //   final String tokenEndpoint = "https://api-qa.ucsd.edu:8243/token";
  //   final Map<String, String> tokenHeaders = {
  //     "content-type": 'application/x-www-form-urlencoded',
  //     "Authorization":
  //         "Basic djJlNEpYa0NJUHZ5akFWT0VRXzRqZmZUdDkwYTp2emNBZGFzZWpmaWZiUDc2VUJjNDNNVDExclVh"
  //   };
  //   try {
  //     final response = await _networkHelper.authorizedPost(
  //         tokenEndpoint, tokenHeaders, "grant_type=client_credentials");
  //
  //     headers["Authorization"] = "Bearer " + response["access_token"];
  //
  //     return true;
  //   } catch (e) {
  //     _error = e.toString();
  //     return false;
  //   }
  // }

  bool get isLoading => _isLoading;

  String? get error => _error;

  DateTime? get lastUpdated => _lastUpdated;

  List<ScheduleOfClassesModel>? get classes => _classes;
}
