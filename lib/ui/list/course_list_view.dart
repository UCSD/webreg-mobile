import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/ui/list/course_card.dart';
import 'package:webreg_mobile_flutter/ui/calendar/calendar.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';
import 'package:webreg_mobile_flutter/ui/search/search_bar.dart';

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
