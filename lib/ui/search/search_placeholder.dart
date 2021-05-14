import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';

class SearchPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'search_bar',
      child: RawMaterialButton(
        onPressed: () { 
          Navigator.pushNamed(context, RoutePaths.SearchView);
        },
        child: Container(
          width: 63.0,
          margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 10.0),
          decoration: new BoxDecoration(
            color: lightGray,
            borderRadius: new BorderRadius.all(Radius.circular(100.0)),
          ),
          child: Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 5.0),
            child: Icon(Icons.search, color: Colors.black, size: 25),
          )
        )
      )
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
