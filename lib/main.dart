import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:webreg_mobile_flutter/app_provider.dart';
import 'package:webreg_mobile_flutter/ui/search/search_placeholder.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_router.dart' as webregMobileRouter;
import 'dart:js' as js;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void getParams() {
  var uri = Uri.dataFromString(window.location.href);
  Map<String, String> params = uri.queryParameters;
  String? _token = params['token'];
}

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late String? _token = '';
// Our current app URL

  void getParams() {
    var uri = Uri.dataFromString(window.location.href);
    Map<String, String> params = uri.queryParameters;
    if (params['token'] != null) _token = params['token'];
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currentUri = Uri.base;
    getParams();

    return MultiProvider(
      providers: providers,
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: ColorPrimary,
          primaryColor: lightPrimaryColor,
          accentColor: darkAccentColor,
          brightness: Brightness.light,
          buttonColor: lightButtonColor,
          textTheme: lightThemeText,
          iconTheme: lightIconTheme,
          appBarTheme: lightAppBarTheme,
          bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.black.withOpacity(0)),
        ),
        initialRoute:
            _token == '' ? RoutePaths.AuthenticationError : RoutePaths.Home,
        onGenerateRoute: webregMobileRouter.Router.generateRoute,
      ),
    );
  }
}
