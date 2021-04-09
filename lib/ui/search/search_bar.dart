import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0.0,
      centerTitle: true,
      title: Container(
        decoration: new BoxDecoration(
          color: lightGray,
          borderRadius: new BorderRadius.all(Radius.circular(100.0)),
          border: Border.all(width: 1.0, color: Color(0xFF034263)),
        ),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: TextField(
          onChanged: (text) { print(text); },
          autofocus: true,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            hintText: 'Search',
            isDense: true, 
          ),
        )
      ),
      automaticallyImplyLeading: false,
      leading: Center(
        child:IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          padding: EdgeInsets.symmetric(horizontal: 9),
          alignment: Alignment.centerLeft,
          iconSize: 25,
          onPressed: () {
            Navigator.pop(context);
          }
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.filter_list, color: Colors.white),
          padding: EdgeInsets.symmetric(horizontal: 9),
          alignment: Alignment.centerLeft,
          iconSize: 25,
        ),
      ]
    );
  }
}

//ListView.builder(
    //   itemCount: 10,
    //   itemBuilder: (BuildContext cont, int index) {
    //     return new ListTile(
    //       title: Text("text" + index.toString()),
    //       onTap: () => print("text" + index.toString()),
    //     );
    //   }
    // );
