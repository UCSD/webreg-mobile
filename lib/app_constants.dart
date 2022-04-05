class RoutePaths {
  static const String Home = '/';
  static const String BottomNavigationBar = 'bottom_navigation_bar';
  static const String Calendar = 'calendar';
  static const String CourseList = 'course_list';
  static const String FinalsList = 'finals_list';
  static const String SearchView = 'search_view';
  static const String CourseListView = 'course_list_view';
  static const String SearchDetail = 'search_detail';
  static const String AuthenticationError = 'authentication_error';
}

class CalendarStyles {
  static const double calendarHeaderHeight = 50;
  static const double calendarTimeWidth = 35;
  static const double calendarRowHeight = 60;
}

class ErrorConstants {
  static const String authorizedPostErrors = 'Failed to upload data: ';
  static const String authorizedPutErrors = 'Failed to update data: ';
  static const String invalidBearerToken = 'Invalid bearer token';
  static const String duplicateRecord =
      'DioError [DioErrorType.response]: Http status error [409]';
  static const String invalidMedia =
      'DioError [DioErrorType.response]: Http status error [415]';
  static const String silentLoginFailed = 'Silent login failed';
}

class LoginConstants {
  static const String silentLoginFailedTitle = 'Oops! You\'re not logged in.';
  static const String silentLoginFailedDesc =
      'The system has logged you out (probably by mistake). Go to Profile to log back in.';
  static const String loginFailedTitle = 'Sorry, unable to sign you in.';
  static const String loginFailedDesc =
      'Be sure you are using the correct credentials; TritonLink login if you are a student, SSO (AD or Active Directory) if you are a Faculty/Staff.';
}
