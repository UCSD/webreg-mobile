import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/ui/search/search_placeholder.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_router.dart'
    as webregMobileRouter;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      ),
      initialRoute: RoutePaths.Home,
      onGenerateRoute: webregMobileRouter.Router.generateRoute,
    );
  }
}
