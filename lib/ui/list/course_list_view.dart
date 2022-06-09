// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/ui/list/course_card.dart';

class CourseListView extends StatelessWidget {
  const CourseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      const TermDropdown(),
      Expanded(
          child: ListView.builder(
              itemCount: 10,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (BuildContext context, int index) {
                return const CourseCard();
              }))
    ]));
  }
}

class TermDropdown extends StatefulWidget {
  const TermDropdown({Key? key}) : super(key: key);

  @override
  _TermDropdownState createState() => _TermDropdownState();
}

// TODO(p8gonzal): Can be replaced with live API used in filter for search.
class _TermDropdownState extends State<TermDropdown> {
  List<String> dropdownItems = <String>[
    'Fall 19',
    'Winter 20',
    'Spring 20',
    'Fall 20'
  ];
  String _dropdownVal = 'Fall 19';

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Stack(children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.alarm, color: Colors.black),
              ]),
          Center(
              child: Text(_dropdownVal,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold))),
          DropdownButton<String>(
            isExpanded: true,
            underline: Container(height: 0),
            icon: const Icon(Icons.expand_more, color: Colors.black, size: 30),
            onChanged: (String? newVal) {
              setState(() {
                _dropdownVal = newVal!;
              });
            },
            items: dropdownItems.map<DropdownMenuItem<String>>((String val) {
              return DropdownMenuItem<String>(
                  value: val,
                  child: Center(
                      child: Text(val, style: const TextStyle(fontSize: 18))));
            }).toList(),
          )
        ]));
  }
}
