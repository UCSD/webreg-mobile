import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/ui/search/search_placeholder.dart';
import 'package:webreg_mobile_flutter/ui/calendar/calendar.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';

class CourseCard extends StatelessWidget {
  static const MOCK_DATA = [
    {
      'lecture': {
        'subjectCode': 'COGS',
        'courseCode': '187B',
        'instructionType': 'LE',
        'sectionNumber': '960510',
        'sectionCode': 'A00',
        'specialMeetingCode': '',
        'longDescription': '',
        'sectionStatus': null,
        'enrollmentStatus': 'EN',
        'gradeOption': 'L',
        'creditHours': 4,
        'gradeOptionPlus': true,
        'creditHoursPlus': false,
        'courseTitle': 'Practicum in Pro Web Design',
        'enrollmentCapacity': 60,
        'enrollmentQuantity': 64,
        'countOnWaitlist': 2,
        'stopEnrollmentFlag': true,
        'classTimes': [
          {
            'dayCode': '2',
            'startDate': 1585551600000,
            'beginHHTime': '14',
            'beginMMTime': '0',
            'endHHTime': '15',
            'endMMTime': '20',
            'buildingCode': 'HSS',
            'roomCode': '1346',
            'endDate': '2019-03-15',
          },
          {
            'dayCode': '4',
            'startDate': 1585551600000,
            'beginHHTime': '14',
            'beginMMTime': '0',
            'endHHTime': '15',
            'endMMTime': '20',
            'buildingCode': 'HSS',
            'roomCode': '1346',
            'endDate': '2019-03-15',
          },
        ],
        'instructors': [
          'Kirsh, David Joel',
        ],
      },
      'final': {
        'subjectCode': 'COGS',
        'courseCode': '187B',
        'instructionType': 'LE',
        'sectionNumber': '960510',
        'sectionCode': 'A00',
        'specialMeetingCode': 'FI',
        'longDescription': '',
        'sectionStatus': null,
        'enrollmentStatus': null,
        'gradeOption': null,
        'creditHours': null,
        'gradeOptionPlus': false,
        'creditHoursPlus': false,
        'courseTitle': null,
        'enrollmentCapacity': null,
        'enrollmentQuantity': null,
        'countOnWaitlist': null,
        'stopEnrollmentFlag': false,
        'classTimes': [
          {
            'dayCode': '4',
            'startDate': 1585551600000,
            'beginHHTime': '15',
            'beginMMTime': '0',
            'endHHTime': '17',
            'endMMTime': '59',
            'buildingCode': 'HSS',
            'roomCode': '1346',
            'endDate': null,
          },
        ],
        'instructors': [
          'Kirsh, David Joel',
        ],
      },
      'discussion': {
        'subjectCode': 'COGS',
        'courseCode': '187B',
        'instructionType': 'DI',
        'sectionNumber': '960510',
        'sectionCode': 'A00',
        'specialMeetingCode': '',
        'longDescription': '',
        'sectionStatus': null,
        'enrollmentStatus': null,
        'gradeOption': null,
        'creditHours': null,
        'gradeOptionPlus': false,
        'creditHoursPlus': false,
        'courseTitle': null,
        'enrollmentCapacity': null,
        'enrollmentQuantity': null,
        'countOnWaitlist': null,
        'stopEnrollmentFlag': false,
        'classTimes': [
          {
            'dayCode': '2',
            'startDate': 1585551600000,
            'beginHHTime': '11',
            'beginMMTime': '0',
            'endHHTime': '11',
            'endMMTime': '50',
            'buildingCode': 'HSS',
            'roomCode': '1346',
            'endDate': null,
          },
        ],
        'instructors': [
          'Kirsh, David Joel',
        ],
      },
    },
    {
      'lecture': {
        'subjectCode': 'COGS',
        'courseCode': '187B',
        'instructionType': 'LE',
        'sectionNumber': '960510',
        'sectionCode': 'A00',
        'specialMeetingCode': '',
        'longDescription': '',
        'sectionStatus': null,
        'enrollmentStatus': 'EN',
        'gradeOption': 'L',
        'creditHours': 4,
        'gradeOptionPlus': true,
        'creditHoursPlus': false,
        'courseTitle': 'Practicum in Pro Web Design',
        'enrollmentCapacity': 60,
        'enrollmentQuantity': 64,
        'countOnWaitlist': 2,
        'stopEnrollmentFlag': true,
        'classTimes': [
          {
            'dayCode': '2',
            'startDate': 1585551600000,
            'beginHHTime': '14',
            'beginMMTime': '0',
            'endHHTime': '15',
            'endMMTime': '20',
            'buildingCode': 'HSS',
            'roomCode': '1346',
            'endDate': '2019-03-15',
          },
          {
            'dayCode': '4',
            'startDate': 1585551600000,
            'beginHHTime': '14',
            'beginMMTime': '0',
            'endHHTime': '15',
            'endMMTime': '20',
            'buildingCode': 'HSS',
            'roomCode': '1346',
            'endDate': '2019-03-15',
          },
        ],
        'instructors': [
          'Kirsh, David Joel',
        ],
      },
      'final': {
        'subjectCode': 'COGS',
        'courseCode': '187B',
        'instructionType': 'LE',
        'sectionNumber': '960510',
        'sectionCode': 'A00',
        'specialMeetingCode': 'FI',
        'longDescription': '',
        'sectionStatus': null,
        'enrollmentStatus': null,
        'gradeOption': null,
        'creditHours': null,
        'gradeOptionPlus': false,
        'creditHoursPlus': false,
        'courseTitle': null,
        'enrollmentCapacity': null,
        'enrollmentQuantity': null,
        'countOnWaitlist': null,
        'stopEnrollmentFlag': false,
        'classTimes': [
          {
            'dayCode': '4',
            'startDate': 1585551600000,
            'beginHHTime': '15',
            'beginMMTime': '0',
            'endHHTime': '17',
            'endMMTime': '59',
            'buildingCode': 'HSS',
            'roomCode': '1346',
            'endDate': null,
          },
        ],
        'instructors': [
          'Kirsh, David Joel',
        ],
      },
      'discussion': {
        'subjectCode': 'COGS',
        'courseCode': '187B',
        'instructionType': 'DI',
        'sectionNumber': '960510',
        'sectionCode': 'A00',
        'specialMeetingCode': '',
        'longDescription': '',
        'sectionStatus': null,
        'enrollmentStatus': null,
        'gradeOption': null,
        'creditHours': null,
        'gradeOptionPlus': false,
        'creditHoursPlus': false,
        'courseTitle': null,
        'enrollmentCapacity': null,
        'enrollmentQuantity': null,
        'countOnWaitlist': null,
        'stopEnrollmentFlag': false,
        'classTimes': [
          {
            'dayCode': '2',
            'startDate': 1585551600000,
            'beginHHTime': '11',
            'beginMMTime': '0',
            'endHHTime': '11',
            'endMMTime': '50',
            'buildingCode': 'HSS',
            'roomCode': '1346',
            'endDate': null,
          },
        ],
        'instructors': [
          'Kirsh, David Joel',
        ],
      },
    },
    {
      'discussion': {
        'subjectCode': 'LTEA',
        'courseCode': '120A',
        'instructionType': 'LA',
        'sectionNumber': '2064',
        'sectionCode': 'A01',
        'specialMeetingCode': null,
        'longDescription': '',
        'enrollmentStatus': 'EN',
        'gradeOption': 'P',
        'creditHours': 4,
        'gradeOptionPlus': false,
        'creditHoursPlus': false,
        'courseTitle': 'Chinese Films',
        'enrollmentCapacity': 320,
        'enrollmentQuantity': 308,
        'countOnWaitlist': 1,
        'stopEnrollmentFlag': false,
        'classTimes': [
          {
            'dayCode': '1',
            'startDate': 1585551600000,
            'beginHHTime': 17,
            'beginMMTime': 0,
            'endHHTime': 19,
            'endMMTime': 50,
            'buildingCode': '',
            'roomCode': '',
            'endDate': null,
          },
        ],
        'instructors': [
          'Zhang, Yingjin',
        ],
      },
      'lecture': {
        'subjectCode': 'LTEA',
        'courseCode': '120A',
        'instructionType': 'LE',
        'sectionNumber': '2063',
        'sectionCode': 'A00',
        'specialMeetingCode': '',
        'longDescription': 'Visions of the City',
        'enrollmentStatus': 'EN',
        'gradeOption': 'P',
        'creditHours': 4,
        'gradeOptionPlus': false,
        'creditHoursPlus': false,
        'courseTitle': 'Chinese Films',
        'enrollmentCapacity': 320,
        'enrollmentQuantity': 308,
        'countOnWaitlist': 1,
        'stopEnrollmentFlag': false,
        'classTimes': [
          {
            'dayCode': '1',
            'startDate': 1585551600000,
            'beginHHTime': 17,
            'beginMMTime': 0,
            'endHHTime': 19,
            'endMMTime': 50,
            'buildingCode': '',
            'roomCode': '',
            'endDate': null,
          },
        ],
        'instructors': [
          'Zhang, Yingjin',
        ],
      },
      'final': {
        'subjectCode': 'LTEA',
        'courseCode': '120A',
        'instructionType': 'LE',
        'sectionNumber': '2063',
        'sectionCode': 'A00',
        'specialMeetingCode': 'FI',
        'longDescription': 'Visions of the City',
        'enrollmentStatus': null,
        'gradeOption': null,
        'creditHours': null,
        'gradeOptionPlus': false,
        'creditHoursPlus': false,
        'courseTitle': null,
        'enrollmentCapacity': null,
        'enrollmentQuantity': null,
        'countOnWaitlist': null,
        'stopEnrollmentFlag': false,
        'classTimes': [
          {
            'dayCode': '5',
            'startDate': 1591945200000,
            'beginHHTime': 19,
            'beginMMTime': 0,
            'endHHTime': 21,
            'endMMTime': 59,
            'buildingCode': '',
            'roomCode': '',
            'endDate': null,
          },
        ],
        'instructors': [
          'Zhang, Yingjin',
        ],
      },
    },
    {
      'lecture': {
        'subjectCode': 'PHIL',
        'courseCode': '27',
        'instructionType': 'LE',
        'sectionNumber': '5027',
        'sectionCode': 'A02',
        'specialMeetingCode': '',
        'longDescription': '',
        'enrollmentStatus': 'EN',
        'gradeOption': 'P',
        'creditHours': 4,
        'gradeOptionPlus': false,
        'creditHoursPlus': false,
        'courseTitle': 'Ethics And Society',
        'enrollmentCapacity': 37,
        'enrollmentQuantity': 39,
        'countOnWaitlist': 2,
        'stopEnrollmentFlag': false,
        'classTimes': [
          {
            'dayCode': '1',
            'startDate': 1585551600000,
            'beginHHTime': 14,
            'beginMMTime': 0,
            'endHHTime': 14,
            'endMMTime': 50,
            'buildingCode': '',
            'roomCode': '',
            'endDate': 1591340400000,
          },
        ],
        'instructors': [
          'Brandt, Reuven A',
        ],
      },
      'discussion': {
        'subjectCode': 'PHIL',
        'courseCode': '27',
        'instructionType': 'DI',
        'sectionNumber': '5027',
        'sectionCode': 'A02',
        'specialMeetingCode': '',
        'longDescription': '',
        'enrollmentStatus': 'EN',
        'gradeOption': 'P',
        'creditHours': 4,
        'gradeOptionPlus': false,
        'creditHoursPlus': false,
        'courseTitle': 'Ethics And Society',
        'enrollmentCapacity': 37,
        'enrollmentQuantity': 39,
        'countOnWaitlist': 2,
        'stopEnrollmentFlag': false,
        'classTimes': [
          {
            'dayCode': '1',
            'startDate': 1585551600000,
            'beginHHTime': 14,
            'beginMMTime': 0,
            'endHHTime': 14,
            'endMMTime': 50,
            'buildingCode': '',
            'roomCode': '',
            'endDate': 1591340400000,
          },
        ],
        'instructors': [
          'Brandt, Reuven A',
        ],
      },
    },
  ];

  Widget renderActionButtons() {
    return Container(
        width: 45,
        decoration: BoxDecoration(
            border: Border(
          left: BorderSide(color: lightGray),
        )),
        child: Column(children: <Widget>[
          IconButton(
            icon: Icon(Icons.autorenew, color: ColorPrimary),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.delete, color: ColorPrimary),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add_circle, color: ColorPrimary),
            onPressed: () {},
          ),
        ]));
  }

  Widget renderSection() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Text('A00',
                    style: TextStyle(fontSize: 11, color: darkGray)), // TODO
                Text(' LE',
                    style: TextStyle(fontSize: 11, color: darkGray)) // TODO
              ],
            )),
        Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Text('M',
                    style:
                        TextStyle(fontSize: 11, color: ColorPrimary)), // TODO
                Text('T',
                    style: TextStyle(fontSize: 11, color: lightGray)), // TODO
                Text('W',
                    style:
                        TextStyle(fontSize: 11, color: ColorPrimary)), // TODO
                Text('T',
                    style: TextStyle(fontSize: 11, color: lightGray)), // TODO
                Text('F',
                    style:
                        TextStyle(fontSize: 11, color: ColorPrimary)), // TODO
              ],
            )),
        Expanded(
          flex: 5,
          child: Text('3:30p - 4:50p',
              style: TextStyle(fontSize: 11, color: ColorPrimary)), // TODO
        ),
        Expanded(
          flex: 5,
          child: Text('PCYHN 106', style: TextStyle(fontSize: 11)), // TODO
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          side: new BorderSide(color: ColorPrimary, width: 2.0),
          borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ClipPath(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // course header: units, course code, course name
                      Container(
                        child: Row(children: <Widget>[
                          // units icon
                          Container(
                              height: 30,
                              width: 30,
                              decoration: new BoxDecoration(
                                color: lightGray,
                                shape: BoxShape.circle,
                              ),
                              margin: EdgeInsets.only(right: 10),
                              child: Center(
                                  child: Text('4' // TODO
                                      ))),
                          // course info
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('CSE 12',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)), // TODO
                                  Text('Enrolled - Letter',
                                      style: TextStyle(
                                          color: ColorPrimary,
                                          fontSize: 12)), // TODO
                                ],
                              ),
                              Text('Basic Data Struct & OO design') // TODO
                            ],
                          ))
                        ]),
                      ),
                      // instructor andd section id
                      Container(
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Gillespie, Gary N',
                                  style: TextStyle(
                                      color: ColorPrimary,
                                      fontSize: 12)), // TODO
                              Row(children: <Widget>[
                                Text('Section ID',
                                    style: TextStyle(
                                        color: darkGray, fontSize: 12)), // TODO
                                Text('  983761',
                                    style: TextStyle(fontSize: 12)), // TODO
                              ])
                            ]),
                      ),
                      // course sections: di, final
                      renderSection(),
                      renderSection(),
                    ],
                  )),
            ),
            renderActionButtons()
          ],
        ),
        clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
