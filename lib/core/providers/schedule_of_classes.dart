import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';
import 'package:webreg_mobile_flutter/core/services/schedule_of_classes.dart';
import 'package:flutter/material.dart';

class ScheduleOfClassesProvider extends ChangeNotifier {
  ScheduleOfClassesProvider() {
    /// DEFAULT STATES
    _isLoading = false;
    _noResults = false;

    /// initialize services here
    _scheduleOfClassesService = ScheduleOfClassesService();

    _scheduleOfClassesModels = [];
  }

  /// STATES
  bool? _isLoading;
  DateTime? _lastUpdated;
  String? _error;
  bool? _noResults;

  /// MODELS
  List<ScheduleOfClassesModel> _scheduleOfClassesModels = [];
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

  void fetchClasses() async {
    String SearchQuery = searchBarController.text;
    String TextQuery = createQuery(SearchQuery);
    _isLoading = true;
    _error = null;
    notifyListeners();

    if (await _scheduleOfClassesService.fetchClasses(TextQuery)) {
      _scheduleOfClassesModels = _scheduleOfClassesService.classes!;
      _noResults = false;

      /// add things to show classes on screen
      ///
      /// conditionals for search history here
    } else {
      _error = _scheduleOfClassesService.error;
      _noResults = true;
    }
  }

  String createQuery(String query) {
    /// create api call format here
    return query;
  }

  ///SIMPLE GETTERS
  bool? get isLoading => _isLoading;
  String? get error => _error;
  DateTime? get lastUpdated => _lastUpdated;
  List<ScheduleOfClassesModel> get scheduleOfClassesModels =>
      _scheduleOfClassesModels;
  //List<String> get searchHistory => _searchHistory;
  TextEditingController get searchBarController => _searchBarController;
  bool? get noResults => _noResults;

  ///Settlers
  set searchBarController(TextEditingController value) {
    _searchBarController = value;
    notifyListeners();
  }
}
