// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';

class SearchPlaceholder extends StatelessWidget {
  const SearchPlaceholder({Key? key}) : super(key: key);

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
                margin:
                    const EdgeInsets.symmetric(horizontal: 7.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: lightGray,
                  borderRadius: BorderRadius.all(const Radius.circular(100.0)),
                ),
                child: Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(right: 5.0),
                  child:
                      const Icon(Icons.search, color: Colors.black, size: 25),
                ))));
  }

  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
