import 'dart:async';
import 'dart:convert';
import 'package:webreg_mobile_flutter/app_networking.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';
import 'package:webreg_mobile_flutter/core/providers/user.dart';

class ScheduleOfClassesService {
  final String academicTermAPI =
      'https://o17lydfach.execute-api.us-west-2.amazonaws.com/qa-peter/v1/term/current';
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
      /// fetch data
      final String? _response = await _networkHelper.authorizedFetch(
          baseEndpoint + '?' + query, headers);
      if (_response != null) {
        /// parse data
        final ScheduleOfClassesModel data =
            classScheduleModelFromJson(_response);
        classes = data;
      } else {
        _isLoading = false;
        return false;
      }
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      return false;
    }
  }

  Future<List<String>> fetchTerms() async {
    final List<String> terms = <String>['FA', 'WI', 'SP', 'S1', 'S2'];

    try {
      /// fetch data
      final Map<String, String> headers = <String, String>{
        'accept': 'application/json',
      };
      final String _response =
          await _networkHelper.authorizedFetch(academicTermAPI, headers);

      // final Map<String, dynamic> responseMapping = json.decode(_response);
      final String currentTerm = json.decode(_response)['term_code'];
      final String currentYear = currentTerm.substring(2, 4);
      final String currentQuarter = currentTerm.substring(0, 2);
      final int indexOfQuarter = terms.indexOf(currentQuarter);

      //Rotate terms clockwise to present current term as last
      for (int i = indexOfQuarter; i < terms.length - 1; i++) {
        final String lastQuarter = terms[terms.length - 1];
        for (int quarterIndex = terms.length - 1;
            quarterIndex > 0;
            quarterIndex--) {
          terms[quarterIndex] = terms[quarterIndex - 1];
        }
        terms[0] = lastQuarter;
      }

      // Illustration of possible term structure
      // Update prefixes for each term
      //WI21 - SP21 - S121 - S221 - FA21
      //SP21 - S121 - S221 - FA21 - WI22
      //S121 - S221 - FA21 - WI22 - SP22
      //S221 - FA21 - WI22 - SP22 - S122
      //FA21 - WI22 - SP22 - S122 - S222
      final int fallIdx = terms.indexOf('FA');
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
}
