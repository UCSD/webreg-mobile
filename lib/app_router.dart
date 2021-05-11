import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/ui/search/search_view.dart';
import 'package:webreg_mobile_flutter/ui/list/course_list_view.dart';
import 'package:webreg_mobile_flutter/ui/navigator/bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print('route' + settings.name);
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute<void>(builder: (_) => BottomNavigation());
      case RoutePaths.SearchView:
        return MaterialPageRoute<void>(builder: (_) => SearchView());
      case RoutePaths.CourseListView:
        return MaterialPageRoute<void>(builder: (_) => CourseListView());
    }
  }
}