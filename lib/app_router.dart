import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/ui/search/search_view.dart';
import 'package:webreg_mobile_flutter/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => Home());
      case RoutePaths.SearchView:
        return MaterialPageRoute(builder: (_) => SearchView());
    }
  }
}