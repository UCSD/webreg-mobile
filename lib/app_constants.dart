class RoutePaths {
  static const String Home = '/';
  static const String BottomNavigationBar = 'bottom_navigation_bar';
  static const String Calendar = 'calendar';
  static const String CourseList = 'course_list';
  static const String FinalsList = 'finals_list';
  static const String SearchView = 'search_view';
  static const String CourseListView = 'course_list_view';
  static const String Login = 'login';
  static const String SearchDetail = 'search_detail';
}

class CalendarStyles {
  static const double calendarHeaderHeight = 50;
  static const double calendarTimeWidth = 35;
  static const double calendarRowHeight = 60;
}

class ErrorConstants {
  static const authorizedPostErrors = 'Failed to upload data: ';
  static const authorizedPutErrors = 'Failed to update data: ';
  static const invalidBearerToken = 'Invalid bearer token';
  static const duplicateRecord =
      'DioError [DioErrorType.response]: Http status error [409]';
  static const invalidMedia =
      'DioError [DioErrorType.response]: Http status error [415]';
  static const silentLoginFailed = "Silent login failed";
}
