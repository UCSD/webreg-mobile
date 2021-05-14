import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';
import 'package:webreg_mobile_flutter/ui/calendar/bottom_course_card.dart';


class CalendarCard extends StatefulWidget {
  final String startTime, endTime, datePrefix, type, title, location;
  final int dayOfWeek;

  const CalendarCard(this.startTime, this.endTime, this.datePrefix, this.dayOfWeek, this.type, this.title, this.location);

  @override
  _CalendarCardState createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  static const earliestClass = '08:00';

  double getTimeDifference(String start, String end, String prefix) {
    double diff = DateTime.parse(prefix + end).difference(DateTime.parse(prefix + start)).inMinutes.toDouble();
    print(diff.toString());
    return diff;
  }
  
  @override
  Widget build(BuildContext context) {
    double calendarCardWidth = (MediaQuery.of(context).size.width - CalendarStyles.calendarTimeWidth - 20) / 7;
    bool _showModal = false;

    return Positioned(
      top: getTimeDifference(earliestClass, widget.startTime, widget.datePrefix),
      left: CalendarStyles.calendarTimeWidth + widget.dayOfWeek * calendarCardWidth,
      child: GestureDetector(
        onTap: () {
          Scaffold.of(context).showBottomSheet<void>(
            (BuildContext context) {
              return BottomCourseCard(context);
            }
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
            // border: Border.all(width: 1, color: )
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 2.5,
                offset: Offset(1, 1),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 2.5,
                offset: Offset(-1, 1),
              ),
            ],
          ),
          height: getTimeDifference(widget.startTime, widget.endTime, widget.datePrefix),
          width: calendarCardWidth,
          child: Column(
            children: <Widget>[
              Container(
                height: 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(2.0),
                    topLeft: Radius.circular(2.0),
                  ),
                  color: lightBlue,
                ),
                child: Center(
                  child: Text(widget.type, style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)), // TODO, replace with real data
                )
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.title, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: -0.3)),
                    Text(widget.location, style: TextStyle(fontSize: 9, letterSpacing: -0.3)),
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }
}


