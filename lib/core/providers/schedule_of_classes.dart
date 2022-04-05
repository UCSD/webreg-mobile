import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';
import 'package:webreg_mobile_flutter/core/providers/user.dart';
import 'package:webreg_mobile_flutter/core/services/schedule_of_classes.dart';

class ScheduleOfClassesProvider extends ChangeNotifier {
  ScheduleOfClassesProvider() {
    /// DEFAULT STATES
    _isLoading = false;
    _noResults = false;

    /// initialize services here
    _scheduleOfClassesService = ScheduleOfClassesService();

    _scheduleOfClassesModels = ScheduleOfClassesModel();
  }

  /// STATES
  bool? _isLoading;
  DateTime? _lastUpdated;
  String? _error;
  bool? _noResults;

  /// MODELS
  ScheduleOfClassesModel _scheduleOfClassesModels = ScheduleOfClassesModel();
  String? searchQuery;
  String? term;
  TextEditingController _searchBarController = TextEditingController();
  //UserDataProvider? _userDataProvider;
  bool? lowerDiv;
  bool? upperDiv;
  bool? graduateDiv;

  /// SERVICES
  late ScheduleOfClassesService _scheduleOfClassesService;

  ScheduleOfClassesService get scheduleOfClassesService =>
      _scheduleOfClassesService;

  late UserDataProvider _userDataProvider;

  set userDataProvider(UserDataProvider userDataProvider) {
    _userDataProvider = userDataProvider;
  }

  Future<bool> fetchClasses(String query) async {
    final Map<String, String> headers = <String, String>{
      'Authorization': 'Bearer ${_userDataProvider.accessToken}'
    };

    return _scheduleOfClassesService.fetchClasses(headers, query);
  }

  String createQuery(String query) {
    /// create api call format here
    return query;
  }

  ///SIMPLE GETTERS
  bool? get isLoading => _isLoading;
  String? get error => _error;
  DateTime? get lastUpdated => _lastUpdated;
  ScheduleOfClassesModel get scheduleOfClassesModels =>
      _scheduleOfClassesModels;
  TextEditingController get searchBarController => _searchBarController;
  bool? get noResults => _noResults;

  ///Settlers
  set searchBarController(TextEditingController value) {
    _searchBarController = value;
    notifyListeners();
  }
}
