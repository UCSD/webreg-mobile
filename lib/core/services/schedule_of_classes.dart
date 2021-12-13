import 'dart:async';

import 'package:webreg_mobile_flutter/app_networking.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';

class ScheduleOfClassesService {
  bool _isLoading = false;
  DateTime? _lastUpdated;
  String? _error;
  ScheduleOfClassesModel? classes;
  final NetworkHelper _networkHelper = NetworkHelper();
  final Map<String, String> headers = {
    "accept": "application/json",
  };
  final String baseEndpoint =
      "https://api-qa.ucsd.edu:8243/get_schedule_of_classes/v1/classes/search";

  Future<bool> fetchClasses(String query) async {
    _error = null;
    _isLoading = true;
    try {
      await getNewToken();
      /// fetch data
      String? _response = await _networkHelper
          .authorizedFetch(baseEndpoint + '?' + query, headers);
      print(_response);//addarameters here
      if (_response != null) {
        final ScheduleOfClassesModel data =
            classScheduleModelFromJson(_response);
        classes = data as ScheduleOfClassesModel;
        print(classes!.courses.toString());
      } else {
        /// parse data


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

  ScheduleOfClassesModel? get _classes => classes;
  Future<bool> getNewToken() async {
    final String tokenEndpoint = "https://api-qa.ucsd.edu:8243/token";
    final Map<String, String> tokenHeaders = {
      "content-type": 'application/x-www-form-urlencoded',
      "Authorization":
      "Basic djJlNEpYa0NJUHZ5akFWT0VRXzRqZmZUdDkwYTp2emNBZGFzZWpmaWZiUDc2VUJjNDNNVDExclVh"
    };
    //TODO: Have subscription set up for webreg mobile. Investigate alternatives to Dio.
    try {
      // var response = await _networkHelper.authorizedPost(
      //     tokenEndpoint, tokenHeaders, "grant_type=client_credentials");
      // TODO(Peter): Insert your own authetication token for demo. Will be replaced by application credentials
      headers["Authorization"] = "Bearer " + "";
          //response["access_token"];

      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    }
  }
}
