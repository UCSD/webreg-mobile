import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';
import 'package:webreg_mobile_flutter/core/models/profile.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';
import 'package:webreg_mobile_flutter/core/providers/profile.dart';
import 'package:webreg_mobile_flutter/core/providers/user.dart';
import 'package:webreg_mobile_flutter/ui/calendar/calendar_card.dart';
import 'package:webreg_mobile_flutter/ui/common/build_info.dart';

class Calendar extends StatefulWidget {
  final String calendarType;

  const Calendar(String s, {Key? key, required this.calendarType})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<Calendar> {
  late ProfileProvider profileProvider;
  late String calendarType;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    profileProvider.userDataProvider =
        Provider.of<UserDataProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    calendarType = widget.calendarType;
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: <Widget>[
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
                        .map((String day) => Expanded(
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
              child: Stack(
            children: <Widget>[
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

              //Extract relevant data from profile and create calendar cards

              FutureBuilder(
                  future: profileProvider.fetchProfile(),
                  builder:
                      (BuildContext context, AsyncSnapshot<Object?> response) {
                    if (response.hasData) {
                      final ProfileModel model =
                          profileProvider.profileService.profile!;

                      List<SectionData>? courseList = model.enrolledCourses;

                      // Change for switching between Lectures/Discussion and Finals
                      if (calendarType == 'LECT_DISC') {
                        final List<CalendarCard> sectionCards =
                            <CalendarCard>[];
                        final List<String> sectionTypes = <String>[];
                        final List<SectionData> sectionObjects =
                            <SectionData>[];
                        for (final SectionData section in courseList!) {
                          if (section.sectionStatus != 'CA') {
                            sectionTypes.add(section.instructionType!);
                            sectionObjects.add(section);
                          }
                        }
                        int sectionIndex = 0;
                        List<SectionData> lectureObjects = [];

                        // Identify lecture objects
                        while (sectionTypes.contains('LE')) {
                          int lectureIndex = sectionTypes.indexOf('LE');
                          SectionData lectureObject =
                              sectionObjects.elementAt(lectureIndex);
                          lectureObjects.add(lectureObject);
                          sectionTypes.removeAt(lectureIndex);
                          sectionObjects.removeAt(lectureIndex);
                        }

                        sectionIndex = 0;
                        for (final String sectionType
                            in sectionTypes.toList()) {
                          sectionCards.add(buildCalendarCard(
                              sectionType, sectionObjects[sectionIndex]));
                          sectionIndex++;
                        }

                        for (final SectionData lecture in lectureObjects) {
                          int meetingIndex = 0;
                          for (final MeetingData meetingData
                              in lecture.recurringMeetings!.toList()) {
                            SectionData CopyOfLectureObject =
                                SectionData.fromJson(lecture.toJson());
                            CopyOfLectureObject.recurringMeetings = [];
                            CopyOfLectureObject.recurringMeetings!
                                .add(lecture.recurringMeetings![meetingIndex]);
                            sectionTypes
                                .add(CopyOfLectureObject.instructionType!);
                            sectionObjects.add(CopyOfLectureObject);
                            meetingIndex++;
                          }
                        }
                        // sectionTypes.add('FI');
                        // sectionObjects.add(SectionData());

                        sectionIndex = 0;
                        for (final String sectionType
                            in sectionTypes.toList()) {
                          sectionCards.add(buildCalendarCard(
                              sectionType, sectionObjects[sectionIndex]));
                          sectionIndex++;
                        }

                        return Stack(children: <CalendarCard>[...sectionCards]);
                      } else {
                        final List<CalendarCard> sectionCards =
                            <CalendarCard>[];
                        final List<String> sectionTypes = <String>[];
                        final List<SectionData> sectionObjects =
                            <SectionData>[];
                        for (final SectionData section in courseList!) {
                          if (section.instructionType == 'LE') {
                            sectionTypes.add('FI');
                            sectionObjects.add(section);
                          }
                        }

                        int sectionIndex = 0;
                        for (final String sectionType
                            in sectionTypes.toList()) {
                          sectionCards.add(buildCalendarCard(
                              sectionType, sectionObjects[sectionIndex]));
                          sectionIndex++;
                        }

                        return Stack(children: <CalendarCard>[...sectionCards]);
                      }
                    } else {
                      return CalendarCard('10:00', '10:50', '2020-06-06T', 0,
                          'LE', '', '', Colors.blue.shade200);
                    }
                  }),
            ],
          ))
          // BuildInfo(),
        ]));
  }

  // Fix an incorrectly formatted time
  void correctTimeFormat(MeetingData meeting) {
    while (meeting.startTime!.length < 4) {
      meeting.startTime = '0' + meeting.startTime!;
    }
    while (meeting.endTime!.length < 4) {
      meeting.endTime = '0' + meeting.endTime!;
    }
  }

  static const List<String> dayOfWeek = [
    'Mon',
    'Tues',
    'Wed',
    'Thurs',
    'Fri',
    'Sat',
    'Sun',
  ];

  static const Map<String, int> dayMapping = {
    'MO': 0,
    'TU': 1,
    'WE': 2,
    'TH': 3,
    'FR': 4
  };

  static const List<String> times = [
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
  CalendarCard buildCalendarCard(
      String sectionType, SectionData sectionObject) {
    switch (sectionType) {
      case 'LE':
        {
          // Time parsing
          // Checking for classes that start have *** format instead of ****
          correctTimeFormat(sectionObject.recurringMeetings!.first);
          const String prefix = '0000-01-01T';
          String startTime = DateFormat.jm().format(DateTime.parse(
              prefix + sectionObject.recurringMeetings!.first.startTime!));
          String endTime = DateFormat.jm().format(DateTime.parse(
              prefix + sectionObject.recurringMeetings!.first.endTime!));
          startTime = startTime.toLowerCase().replaceAll(' ', '');
          endTime = endTime.toLowerCase().replaceAll(' ', '');

          // Room Code and Number parsing
          final String room =
              sectionObject.recurringMeetings!.first.buildingCode! +
                  ' ' +
                  sectionObject.recurringMeetings!.first.roomCode!.substring(1);
          // Construct Card widget
          return CalendarCard(
              sectionObject.recurringMeetings!.first.startTime!,
              sectionObject.recurringMeetings!.first.endTime!,
              prefix,
              dayMapping[sectionObject.recurringMeetings!.first.dayCode]!,
              sectionType,
              '${sectionObject.subjectCode} ${sectionObject.courseCode}',
              room,
              Colors.blue.shade200);
        }
      case 'DI':
        {
          // Time parsing
          // Checking for classes that start have *** format instead of ****
          correctTimeFormat(sectionObject.recurringMeetings!.first);
          const String prefix = '0000-01-01T';
          String startTime = DateFormat.jm().format(DateTime.parse(
              prefix + sectionObject.recurringMeetings!.first.startTime!));
          String endTime = DateFormat.jm().format(DateTime.parse(
              prefix + sectionObject.recurringMeetings!.first.endTime!));
          startTime = startTime.toLowerCase().replaceAll(' ', '');
          endTime = endTime.toLowerCase().replaceAll(' ', '');

          // Room Code and Number parsing
          final String room =
              sectionObject.recurringMeetings!.first.buildingCode! +
                  ' ' +
                  sectionObject.recurringMeetings!.first.roomCode!.substring(1);

          // Construct Card widget
          return CalendarCard(
              sectionObject.recurringMeetings!.first.startTime!,
              sectionObject.recurringMeetings!.first.endTime!,
              prefix,
              dayMapping[sectionObject.recurringMeetings!.first.dayCode]!,
              'DI',
              '${sectionObject.subjectCode} ${sectionObject.courseCode}',
              room,
              Colors.blue.shade200);
        }
      case 'LA':
        {
          // Time parsing
          // Checking for classes that start have *** format instead of ****
          correctTimeFormat(sectionObject.recurringMeetings!.first);
          const String prefix = '0000-01-01T';
          String startTime = DateFormat.jm().format(DateTime.parse(
              prefix + sectionObject.recurringMeetings!.first.startTime!));
          String endTime = DateFormat.jm().format(DateTime.parse(
              prefix + sectionObject.recurringMeetings!.first.endTime!));
          startTime = startTime.toLowerCase().replaceAll(' ', '');
          endTime = endTime.toLowerCase().replaceAll(' ', '');

          // Room Code and Number parsing
          final String room =
              sectionObject.recurringMeetings!.first.buildingCode! +
                  ' ' +
                  sectionObject.recurringMeetings!.first.roomCode!.substring(1);

          // Construct Card widget
          return CalendarCard(
              sectionObject.recurringMeetings!.first.startTime!,
              sectionObject.recurringMeetings!.first.endTime!,
              prefix,
              dayMapping[sectionObject.recurringMeetings!.first.dayCode]!,
              'LA',
              '${sectionObject.subjectCode} ${sectionObject.courseCode}',
              room,
              Colors.blue.shade200);
        }
      case 'FI':
        {
          MeetingData finalMeeting = MeetingData();
          for (final MeetingData meetingData
              in sectionObject.additionalMeetings!) {
            if (meetingData.meetingType == 'FI') {
              finalMeeting = meetingData;
            }
          }

          // Time parsing
          // Checking for classes that start have *** format instead of ****
          correctTimeFormat(finalMeeting);
          const String prefix = '0000-01-01T';
          String startTime = DateFormat.jm()
              .format(DateTime.parse(prefix + finalMeeting.startTime!));
          String endTime = DateFormat.jm()
              .format(DateTime.parse(prefix + finalMeeting.endTime!));
          startTime = startTime.toLowerCase().replaceAll(' ', '');
          endTime = endTime.toLowerCase().replaceAll(' ', '');

          // Room Code and Number parsing
          final String room = finalMeeting.buildingCode! +
              ' ' +
              finalMeeting.roomCode!.substring(1);

          // Construct Card widget
          return CalendarCard(
              finalMeeting.startTime!,
              finalMeeting.endTime!,
              prefix,
              dayMapping[sectionObject.recurringMeetings!.first.dayCode]!,
              'FI',
              "${sectionObject.subjectCode} ${sectionObject.courseCode}",
              room,
              Colors.blue.shade200);
        }
      default:
        // Time parsing
        // Checking for classes that start have *** format instead of ****
        correctTimeFormat(sectionObject.recurringMeetings!.first);
        const String prefix = '0000-01-01T';
        String startTime = DateFormat.jm().format(DateTime.parse(
            prefix + sectionObject.recurringMeetings!.first.startTime!));
        String endTime = DateFormat.jm().format(DateTime.parse(
            prefix + sectionObject.recurringMeetings!.first.endTime!));
        startTime = startTime.toLowerCase().replaceAll(' ', '');
        endTime = endTime.toLowerCase().replaceAll(' ', '');

        // Room Code and Number parsing
        final String room =
            sectionObject.recurringMeetings!.first.buildingCode! +
                ' ' +
                sectionObject.recurringMeetings!.first.roomCode!.substring(1);

        // Construct Card widget
        return CalendarCard(
            startTime,
            endTime,
            prefix,
            sectionObject.units!.toInt(),
            sectionType,
            "${sectionObject.subjectCode} ${sectionObject.courseCode}",
            room,
            Colors.blue.shade200);
    }
  }
}
