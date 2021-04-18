import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/ui/search/search_bar.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';

// contains search bar and search results
class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Hero(
          tag: 'search_bar',
          child: SearchBar(),
        ),
      ),
      body: 
        // child: Column(
        //   children: <Widget>[
            // Hero(
            //   tag: 'search_bar',
            //   child: SearchBar(),
            // ),
            Center(
              // color: Colors.red,
              child: Text(
                "Search by course code\ne.g. ANTH 23",
                style: TextStyle(color: darkGray, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            )
        //   ]
        // )
    );
  }

}