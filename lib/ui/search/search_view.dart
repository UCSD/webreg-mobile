import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/ui/search/search_bar.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return Container(
      child: Column(
        children: <Widget>[
          Hero(
            tag: 'search_bar',
            child: SearchBar(),
          ),
        ]
      )
    );
  }

}