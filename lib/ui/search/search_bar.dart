// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';
import 'package:webreg_mobile_flutter/core/providers/schedule_of_classes.dart';

class SearchBar extends StatelessWidget {
  const SearchBar(this.setOpenFilters, {Key? key}) : super(key: key);
  final VoidCallback setOpenFilters;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: AppBar(
            titleSpacing: 0.0,
            centerTitle: true,
            title: Container(
              decoration: BoxDecoration(
                color: lightGray,
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                border: Border.all(width: 1.0, color: Color(0xFF034263)),
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Search(),
            ),
            automaticallyImplyLeading: false,
            leading: Center(
              child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  padding: EdgeInsets.symmetric(horizontal: 9),
                  alignment: Alignment.centerLeft,
                  iconSize: 25,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.filter_list, color: Colors.white),
                padding: EdgeInsets.symmetric(horizontal: 9),
                alignment: Alignment.centerLeft,
                iconSize: 25,
                onPressed: setOpenFilters,
              ),
            ]));
  }
}

class TermDropdown extends StatefulWidget {
  const TermDropdown({Key? key}) : super(key: key);

  @override
  _TermDropdownState createState() => _TermDropdownState();
}

// TODO(p8gonzal): Can be replaced by live API used in search
class _TermDropdownState extends State<TermDropdown> {
  List<String> dropdownItems = <String>['SP21', 'FA21', 'WI22', 'SP22'];
  String _dropdownVal = 'SP22';
  late DropdownButton<String> dropdownButton;

  String get dropDownValue {
    return _dropdownVal;
  }

  @override
  Widget build(BuildContext context) {
    dropdownButton = DropdownButton<String>(
      underline: Container(height: 0),
      value: _dropdownVal,
      icon: Icon(Icons.arrow_drop_down, color: Colors.black, size: 20),
      onChanged: (String? newVal) {
        setState(() {
          _dropdownVal = newVal!;
        });
      },
      items: dropdownItems.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem<String>(
            value: val,
            child: Text(val,
                style: TextStyle(
                    color: darkGray,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)));
      }).toList(),
    );

    return dropdownButton;
  }
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Widget _icon = Icon(Icons.search, size: 20, color: darkGray);
  ScheduleOfClassesProvider provider = ScheduleOfClassesProvider();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 35,
        child: Row(
          children: <Widget>[
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
                )),
            Expanded(
              child: TextField(
                onChanged: (String text) {
                  provider.searchBarController.text = text;
                  if (text.isNotEmpty) {
                    _icon = GestureDetector(
                        child: Icon(Icons.close, size: 20, color: darkGray),
                        onTap: () {
                          provider.searchBarController.clear();
                        });
                  } else {
                    _icon = Icon(Icons.search, size: 20, color: darkGray);
                  }
                },
                controller: provider.searchBarController,
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
            ),
          ],
        ));
  }
}
