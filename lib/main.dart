import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_provider.dart';
import 'package:webreg_mobile_flutter/app_router.dart' as webreg_router;
import 'package:webreg_mobile_flutter/app_styles.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  late String? _token = '';

  void getParams() {
    final Uri uri = Uri.dataFromString(window.location.href);
    final Map<String, String> params = uri.queryParameters;
    if (params['token'] != null) {
      _token = params['token'];
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getParams();

    return MultiProvider(
      providers: providers,
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: lightPrimaryColor,
          brightness: Brightness.light,
          textTheme: lightThemeText,
          iconTheme: lightIconTheme,
          appBarTheme: lightAppBarTheme,
          bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.black.withOpacity(0)),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: ColorPrimary)
              .copyWith(secondary: darkAccentColor),
        ),
        initialRoute:
            _token == '' ? RoutePaths.AuthenticationError : RoutePaths.Home,
        onGenerateRoute: webreg_router.Router.generateRoute,
      ),
    );
  }
}
