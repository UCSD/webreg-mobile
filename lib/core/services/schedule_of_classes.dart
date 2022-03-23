import 'dart:async';
import 'dart:convert';
import 'package:webreg_mobile_flutter/app_networking.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';

class ScheduleOfClassesService {
  final String ACADEMIC_TERM =
      'https://o17lydfach.execute-api.us-west-2.amazonaws.com/qa-peter/v1/term/current';
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

  Future<List<String>> fetchTerms() async {
    final List<String> terms = ['FA', 'WI', 'SP', 'S1', 'S2'];

    try {
      /// fetch data
      final Map<String, String> headers = <String, String>{
        'accept': 'application/json',
      };
      final String _response =
          await _networkHelper.authorizedFetch(ACADEMIC_TERM, headers);

      // final Map<String, dynamic> responseMapping = json.decode(_response);
      final String currentTerm = json.decode(_response)['term_code'];
      final String currentYear = currentTerm.substring(2, 4);
      final String currentQuarter = currentTerm.substring(0, 2);
      final int indexOfQuarter = terms.indexOf(currentQuarter);

      for (int i = indexOfQuarter; i < terms.length - 1; i++) {
        final String lastQuarter = terms[terms.length - 1];
        for (int quarterIndex = terms.length - 1;
            quarterIndex > 0;
            quarterIndex--) {
          terms[quarterIndex] = terms[quarterIndex - 1];
        }
        terms[0] = lastQuarter;
      }

      //WI21 - SP21 - S121 - S221 - FA21
      //SP21 - S121 - S221 - FA21 - WI22
      //S121 - S221 - FA21 - WI22 - SP22
      //S221 - FA21 - WI22 - SP22 - S122
      //FA21 - WI22 - SP22 - S122 - S222
      int fallIdx = terms.indexOf('FA');
      for (int i = 0; i < terms.length; i++) {
        if (i > fallIdx) {
          terms[i] = terms[i] + currentYear;
        } else {
          terms[i] = terms[i] + (int.parse(currentYear) - 1).toString();
        }
      }
      return terms;
    } catch (e) {
      return terms;
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
