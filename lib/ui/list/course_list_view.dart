import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/ui/list/course_card.dart';
import 'package:webreg_mobile_flutter/ui/calendar/calendar.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';

class CourseListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      TermDropdown(),
      Expanded(
          child: Container(
        child: ListView.builder(
            itemCount: 10,
            padding: EdgeInsets.symmetric(vertical: 8),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: CourseCard(),
              );
            }),
      ))
    ]));
  }
}

class TermDropdown extends StatefulWidget {
  @override
  _TermDropdownState createState() => _TermDropdownState();
}

// TODO
class _TermDropdownState extends State<TermDropdown> {
  List<String> dropdownItems = ['Fall 19', 'Winter 20', 'Spring 20', 'Fall 20'];
  String _dropdownVal = 'Fall 19';

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Stack(children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.alarm, color: Colors.black),
              ]),
          Center(
              child: Text(_dropdownVal,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DropdownButton<String>(
            isExpanded: true,
            underline: Container(height: 0),
            icon: Icon(Icons.expand_more, color: Colors.black, size: 30),
            onChanged: (String? newVal) {
              setState(() {
                _dropdownVal = newVal!;
              });
            },
            items: dropdownItems.map<DropdownMenuItem<String>>((String val) {
              return DropdownMenuItem<String>(
                  value: val,
                  child:
                      Center(child: Text(val, style: TextStyle(fontSize: 18))));
            }).toList(),
          )
        ]));
  }
}
