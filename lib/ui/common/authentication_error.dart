import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webreg_mobile_flutter/core/providers/user.dart';
import 'dart:html' as html;

import '../../app_constants.dart';

class AuthenticationError extends StatefulWidget {
  @override
  _AuthenticationErrorState createState() => _AuthenticationErrorState();
}

class _AuthenticationErrorState extends State<AuthenticationError> {
  late UserDataProvider userDataProvider;
  String _token = '';
  String clientId = 'CLIENT_ID_PLACEHOLDER';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userDataProvider = Provider.of<UserDataProvider>(context);
  }

  @override
  void initState() {
    super.initState();

    final currentUrl = Uri.base;
    if (!currentUrl.fragment.contains('access_token=')) {
      // You are not connected so redirect to the Twitch authentication page.
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        html.window.location.assign(
          'https://api-qa.ucsd.edu:8243/authorize?response_type=token&client_id=$clientId&redirect_uri=${currentUrl.origin}&scope=viewing_activity_read',
        );
        // final fragments = currentUrl.fragment.split('&');
        // _token = fragments
        //     .firstWhere((e) => e.startsWith('access_token='))
        //     .substring('access_token='.length);
        // userDataProvider.accessToken = _token;
      });
    } else {
      final fragments = currentUrl.fragment.split('&');
      _token = fragments
          .firstWhere((e) => e.startsWith('access_token='))
          .substring('access_token='.length);
      userDataProvider.accessToken = _token;
    }
  }
// @override
//  void initState() {
//   super.initState();

//   final currentUrl = Uri.base;
//   if (!currentUrl.fragment.contains('access_token=')) {
//     // You are not connected so redirect to the Twitch authentication page.
//     WidgetsBinding.instance!.addPostFrameCallback((_) {
//       html.window.location.assign(
//         'https://id.twitch.tv/oauth2/authorize?response_type=token&client_id=$clientId&redirect_uri=${currentUrl.origin}&scope=viewing_activity_read',
//       );
//     });
//   } else {
//     // You are connected, you can grab the code from the url.
//     final fragments = currentUrl.fragment.split('&');
//     _token = fragments
//         .firstWhere((e) => e.startsWith('access_token='))
//         .substring('access_token='.length);
//   }
// }

  @override
  Widget build(BuildContext context) {
    if (userDataProvider.accessToken != '') {
      Navigator.pushNamedAndRemoveUntil(
          context, RoutePaths.Home, (route) => false);
    }
    return const Scaffold(
      body: Center(
        child: Text('Missing Authentication Token'),
      ),
    );
  }
}
