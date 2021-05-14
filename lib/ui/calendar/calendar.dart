import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';
import 'package:webreg_mobile_flutter/ui/calendar/calendar_card.dart';
import 'package:webreg_mobile_flutter/ui/common/build_info.dart';

class Calendar extends StatelessWidget {
  Calendar(this.color);

  final Color color;

  static const earliestClass = '08:00';

  static const times = [
    '8am',
    '9am',
    '10am',
    '11am',
    '12pm',
    '1pm',
    '2pm',
    '3pm',
    '4pm',
    '5pm',
    '6pm',
    '7pm',
    '8pm',
    '9pm',
    '10pm',
  ];

  static const dayOfWeek = [
    'Mon',
    'Tues',
    'Wed',
    'Thurs',
    'Fri',
    'Sat',
    'Sun',
  ];

  static const courses = [
    {
      'datePrefix': '2020-06-06T',
      'startTime': '09:00',
      'endTime': '09:50',
      'dayOfWeek': 1,
      'type': 'LE',
      'title': 'CSE 120',
      'location': 'PCYNH 112',
    },
    {
      'datePrefix': '2020-06-06T',
      'startTime': '09:00',
      'endTime': '09:50',
      'dayOfWeek': 3,
      'type': 'LE',
      'title': 'CSE 120',
      'location': 'PCYNH 112',
    },
    {
      'datePrefix': '2020-06-06T',
      'startTime': '09:00',
      'endTime': '09:50',
      'dayOfWeek': 5,
      'type': 'LE',
      'title': 'CSE 120',
      'location': 'PCYNH 112',
    },
    {
      'datePrefix': '2020-06-06T',
      'startTime': '14:00',
      'endTime': '15:20',
      'dayOfWeek': 1,
      'type': 'LE',
      'title': 'COGS 10',
      'location': 'WLH 110',
    },
    {
      'datePrefix': '2020-06-06T',
      'startTime': '10:00',
      'endTime': '10:50',
      'dayOfWeek': 1,
      'type': 'DI',
      'title': 'CSE 123',
      'location': 'PCYNH 112',
    },
  ];

  double getTimeDifference(String start, String end, String prefix) {
    double diff = DateTime.parse(prefix + end)
        .difference(DateTime.parse(prefix + start))
        .inMinutes
        .toDouble();
    print(diff.toString());
    return diff;
  }

  @override
  Widget build(BuildContext context) {
    double calendarCardWidth = (MediaQuery.of(context).size.width -
            CalendarStyles.calendarTimeWidth -
            20) /
        7;

    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            // calendar header
            Container(
                height: CalendarStyles.calendarHeaderHeight,
                padding: EdgeInsets.only(top: 20, bottom: 15),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: lightGray),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: CalendarStyles.calendarTimeWidth,
                    ),
                    Expanded(
                        child: Row(
                      children: dayOfWeek
                          .map((day) => Expanded(
                                flex: 1,
                                child: Container(
                                    child: Center(
                                        child: Text(day,
                                            style: TextStyle(
                                                fontSize: 10,
                                                letterSpacing: -0.1)))),
                              ))
                          .toList(),
                    ))
                  ],
                )),

            Expanded(
                child: Stack(children: <Widget>[
              // calendar body
              ListView.builder(
                  itemCount: times.length,
                  // padding: EdgeInsets.symmetric(vertical: 8),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: CalendarStyles.calendarRowHeight,
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: lightGray),
                          ),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                  width: CalendarStyles.calendarTimeWidth,
                                  child: Center(
                                    child: Text(times[index],
                                        style: TextStyle(fontSize: 10)),
                                  ))
                            ]));
                  }),

              CalendarCard('10:00', '10:50', '2020-06-06T', 0, 'LE', 'CSE 110',
                  'Center 109'),
              CalendarCard('10:00', '10:50', '2020-06-06T', 2, 'LE', 'CSE 110',
                  'Center 109'),
              CalendarCard('10:00', '10:50', '2020-06-06T', 4, 'LE', 'CSE 110',
                  'Center 109'),

              CalendarCard('11:00', '12:20', '2020-06-06T', 1, 'DI', 'CSE 100',
                  'WLH 109'),
              CalendarCard('11:00', '12:20', '2020-06-06T', 3, 'DI', 'CSE 100',
                  'WLH 109'),
            ])),
            BuildInfo(),
          ],
        ));
  }
}
