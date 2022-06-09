// ignore_for_file: always_specify_types

import 'dart:html' as html;
import 'package:flutter/material.dart';
import '../../app_constants.dart';

const String CLIENT_ID = '';

class AuthenticationSSO extends StatefulWidget {
  const AuthenticationSSO({Key? key}) : super(key: key);

  @override
  _AuthenticationSSOState createState() => _AuthenticationSSOState();
}

class _AuthenticationSSOState extends State<AuthenticationSSO> {
  String _token = '';
  String clientId = CLIENT_ID;
  late html.WindowBase popUpWindow;

  @override
  void initState() {
    super.initState();

    final Uri currentUrl = Uri.base;
    
    // If token is not present, open SSO popup
    if (!currentUrl.fragment.contains('access_token=')) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        html.window.location.href =
            'https://api-qa.ucsd.edu:8243/authorize?response_type=token&client_id=$clientId&redirect_uri=${currentUrl.origin}&scope=viewing_activity_read';
      });
    } else {
      // If it is present, okay to move onto main page
      final List<String> fragments = currentUrl.fragment.split('&');
      _token = fragments
          .firstWhere((String e) => e.startsWith('access_token='))
          .substring('access_token='.length);
      WidgetsBinding.instance!.addPostFrameCallback((_) => setState(() {
            _token = fragments
                .firstWhere((String e) => e.startsWith('access_token='))
                .substring('access_token='.length);
          }));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_token != '') {
      Navigator.pushNamedAndRemoveUntil(
          context, RoutePaths.Home, (Route route) => false);
    }
    return const Scaffold(
      body: Center(
        child: Text('Missing Authentication Token'),
      ),
    );
  }
}
