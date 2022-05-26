import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';
import 'package:webreg_mobile_flutter/ui/common/authentication_error.dart';
import 'package:webreg_mobile_flutter/ui/list/course_list_view.dart';
import 'package:webreg_mobile_flutter/ui/login/login.dart';
import 'package:webreg_mobile_flutter/ui/navigator/bottom.dart';
import 'package:webreg_mobile_flutter/ui/search/search_detail.dart';
import 'package:webreg_mobile_flutter/ui/search/search_view.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';

// ignore: avoid_classes_with_only_static_members
class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute<void>(builder: (_) => BottomNavigation());
      case RoutePaths.AuthenticationError:
        return MaterialPageRoute<void>(builder: (_) => AuthenticationError());
      // case RoutePaths.Login:
      //   return MaterialPageRoute<void>(builder: (_) => Login());
      case RoutePaths.SearchView:
        return MaterialPageRoute<void>(builder: (_) => SearchView());
      case RoutePaths.CourseListView:
        return MaterialPageRoute<void>(builder: (_) => CourseListView());
      case RoutePaths.SearchDetail:
        final CourseData course = settings.arguments! as CourseData;
        return MaterialPageRoute(builder: (_) {
          return SearchDetail(data: course);
        });

      default:
        return MaterialPageRoute<void>(builder: (_) => BottomNavigation());
    }
  }
}
