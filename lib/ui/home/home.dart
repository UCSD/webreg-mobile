import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/ui/search/search_placeholder.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Webreg", style: TextStyle(
          fontWeight: FontWeight.normal,
        )),
        actions: <Widget>[
          SearchPlaceholder()
        ]
      ),
    );
  }
}