import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';
import 'dart:math' as math;

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: AppBar(
        titleSpacing: 0.0,
        centerTitle: true,
        title: Container(
          decoration: new BoxDecoration(
            color: lightGray,
            borderRadius: new BorderRadius.all(Radius.circular(100.0)),
            border: Border.all(width: 1.0, color: Color(0xFF034263)),
          ),
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Search(),
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
      )
    );
  }
}

class TermDropdown extends StatefulWidget {
  @override
  _TermDropdownState createState() => _TermDropdownState();
}

class _TermDropdownState extends State<TermDropdown> {
  List<String> dropdownItems = ['FA19', 'WI20', 'SP20', 'FA20'];
  String _dropdownVal = 'FA19';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        underline: Container(
          height: 0
        ),
        value: _dropdownVal,
        icon: Icon(Icons.arrow_drop_down, color: Colors.black, size: 20),
        onChanged: (String newVal) {
          setState(() {
            _dropdownVal = newVal;
          });
        },
        items: dropdownItems.map<DropdownMenuItem<String>>((String val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val, style: TextStyle(color: darkGray, fontSize: 14, fontWeight: FontWeight.bold))
          );
        }).toList(),
    );
  }
}

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Widget _icon = Icon(Icons.search, size: 20, color: darkGray);
  final _searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: Row(children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TermDropdown(),
              Container(
                width: 1.0,
                color: darkGray,
                margin: const EdgeInsets.only(right: 10.0),
              )
            ],
          )
        ),
        Expanded(
          child: TextField(
            onChanged: (text) { 
              // _searchText = text;
              if(text.length > 0) {
                _icon = GestureDetector(
                  child: Icon(Icons.close, size: 20, color: darkGray),
                  onTap: () {
                    _searchText.clear();
                  }
                );
              } else {
                _icon = Icon(Icons.search, size: 20, color: darkGray);
              }
            },
            controller: _searchText,
            autofocus: true,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hintText: 'Search',
              isDense: true, 
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10.0),
          child: _icon,
        )
      ],
      )
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
