import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';

/* This UI page is used to show course offerings/details (prerequisites, sections, finals) 
*  after the user has searched and selected a course.
*/
class SearchDetail extends StatelessWidget {
  SearchDetail({Key? key, required this.data}) : super(key: key);
  final CourseData data;
  Map<String, List<SectionData>> instructorSections =
      <String, List<SectionData>>{};

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
              '${data.departmentCode} ${data.courseCode} \n${data.courseTitle}')),
      body: ListView(
        children: [coursePrereqs(), courseDetails()],
      ));

  Card coursePrereqs() {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const SizedBox(
            width: double.maxFinite,
            height: 50,
            child: Center(
                child: Text(
              'Course Prerequisites and Level Restrictions',
              style: TextStyle(
                color: ColorSecondary,
                fontWeight: FontWeight.bold,
              ),
            ))));
  }

  // Determine types of sections
  Widget courseDetails() {
    final List<Card> sectionCards = <Card>[];
    instructorSections = <String, List<SectionData>>{};

    for (final SectionData section in data.sections!) {
      final String sectionLetter = section.sectionCode![0];
      instructorSections.update(sectionLetter, (List<SectionData> value) {
        value.add(section);
        return value;
      }, ifAbsent: () {
        final List<SectionData> sectionList = <SectionData>[];
        sectionList.add(section);
        return sectionList;
      });
    }

    instructorSections.forEach((String key, List<SectionData> value) {
      final List<String> sectionTypes = <String>[];
      final List<SectionData> sectionObjects = <SectionData>[];
      for (final SectionData section in value) {
        if ((section.instructionType != 'LE' || !sectionTypes.contains('LE')) &&
            section.sectionStatus != 'CA') {
          sectionTypes.add(section.instructionType!);
          sectionObjects.add(section);
        }
      }
      sectionTypes.add('FI');
      sectionObjects.add(SectionData());

      int sectionIndex = 0;
      for (final String sectionType in sectionTypes.toList()) {
        sectionCards
            .add(buildSectionCard(sectionType, sectionObjects[sectionIndex]));
        sectionIndex++;
      }
    });

    return Column(children: <Card>[...sectionCards]);
  }

  Card buildSectionCard(String sectionType, SectionData sectionObject) {
    switch (sectionType) {
      case 'LE':
        {
          // Accumalate all lecture meetings in section
          SectionData lectureObject = SectionData();
          final List<MeetingData> lectureMeetings = <MeetingData>[];
          //instructorSections[sectionObject.sectionCode![0]];

          for (final SectionData section
              in instructorSections[sectionObject.sectionCode![0]]!) {
            if (section.instructionType == 'LE') {
              lectureMeetings.addAll(section.recurringMeetings!);
              lectureObject = section;
            }
          }

          // Instructor name
          String instructorName = '';
          for (final Instructor instructor in lectureObject.instructors!) {
            if (instructor.primaryInstructor!) {
              instructorName = instructor.instructorName!;
            }
          }

          // DAY Section
          List<Widget> days = resetDays();
          days = setDays(days, lectureMeetings);

          // Time parsing
          // Checking for classes that start have *** format instead of ****
          correctTimeFormat(lectureMeetings[0]);
          const String prefix = '0000-01-01T';
          String startTime = DateFormat.jm()
              .format(DateTime.parse(prefix + lectureMeetings[0].startTime!));
          String endTime = DateFormat.jm()
              .format(DateTime.parse(prefix + lectureMeetings[0].endTime!));
          startTime = startTime.toLowerCase().replaceAll(' ', '');
          endTime = endTime.toLowerCase().replaceAll(' ', '');

          // Room Code and Number parsing
          final String room = lectureMeetings[0].buildingCode! +
              ' ' +
              lectureMeetings[0].roomCode!.substring(1);

          // Construct Card widget
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 2.0, bottom: 0.0),
            child: SizedBox(
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 5, bottom: 10),
                    child: Text(
                      instructorName,
                      style: const TextStyle(color: ColorSecondary),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        lectureObject.sectionCode!,
                        style: const TextStyle(color: darkGray),
                      ),
                      Text(sectionType),
                      ...days,
                      Text(startTime + ' - ' + endTime),
                      Text(room)
                    ],
                  )
                ],
              ),
            ),
          );
        }
      case 'DI':
        {
          // Accumalate all discussion meetings in section
          final SectionData discussionObject = sectionObject;
          final List<MeetingData> discussionMeetings = <MeetingData>[];
          discussionMeetings.addAll(discussionObject.recurringMeetings!);

          // DAY Section
          List<Widget> days = resetDays();
          days = setDays(days, discussionMeetings);

          // Time
          // Checking for classes that start have *** format instead of ****
          correctTimeFormat(discussionMeetings[0]);
          const String prefix = '0000-01-01T';
          String startTime = DateFormat.jm().format(
              DateTime.parse(prefix + discussionMeetings[0].startTime!));
          String endTime = DateFormat.jm()
              .format(DateTime.parse(prefix + discussionMeetings[0].endTime!));
          startTime = startTime.toLowerCase().replaceAll(' ', '');
          endTime = endTime.toLowerCase().replaceAll(' ', '');

          // Room parsing
          final String room = discussionMeetings[0].buildingCode! +
              ' ' +
              discussionMeetings[0].roomCode!.substring(1);

          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 2.0, bottom: 0.0),
              child: SizedBox(
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      discussionObject.sectionCode!,
                      style: const TextStyle(color: darkGray),
                    ),
                    Text(sectionType),
                    ...days,
                    Text(startTime + ' - ' + endTime),
                    Text(room)
                  ],
                ),
              ));
        }
      case 'LA':
        {
          // Accumalate all lab meetings in section
          final SectionData labObject = sectionObject;
          final List<MeetingData> labMeetings = <MeetingData>[];
          labMeetings.addAll(sectionObject.recurringMeetings!);

          // DAY Section
          List<Widget> days = resetDays();
          days = setDays(days, labMeetings);

          // Time
          // Checking for classes that start have *** format instead of ****
          correctTimeFormat(labMeetings[0]);
          const String prefix = '0000-01-01T';
          String startTime = DateFormat.jm()
              .format(DateTime.parse(prefix + labMeetings[0].startTime!));
          String endTime = DateFormat.jm()
              .format(DateTime.parse(prefix + labMeetings[0].endTime!));
          startTime = startTime.toLowerCase().replaceAll(' ', '');
          endTime = endTime.toLowerCase().replaceAll(' ', '');

          // Room parsing
          final String room = labMeetings[0].buildingCode! +
              ' ' +
              labMeetings[0].roomCode!.substring(1);

          // Construct Card widget
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 2.0, bottom: 0.0),
            child: SizedBox(
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    labObject.sectionCode!,
                    style: const TextStyle(color: darkGray),
                  ),
                  Text(sectionType),
                  ...days,
                  Text(startTime + ' - ' + endTime),
                  Text(room)
                ],
              ),
            ),
          );
        }
      case 'TU':
        {
          // Accumalate all supplemental instruction meetings in section
          final SectionData labObject = sectionObject;
          final List<MeetingData> labMeetings = <MeetingData>[];
          labMeetings.addAll(sectionObject.recurringMeetings!);

          // DAY Section
          List<Widget> days = resetDays();
          days = setDays(days, labMeetings);

          // Time
          // Checking for classes that start have *** format instead of ****
          correctTimeFormat(labMeetings[0]);
          const String prefix = '0000-01-01T';
          String startTime = DateFormat.jm()
              .format(DateTime.parse(prefix + labMeetings[0].startTime!));
          String endTime = DateFormat.jm()
              .format(DateTime.parse(prefix + labMeetings[0].endTime!));
          startTime = startTime.toLowerCase().replaceAll(' ', '');
          endTime = endTime.toLowerCase().replaceAll(' ', '');

          // Room parsing
          final String room = labMeetings[0].buildingCode! +
              ' ' +
              labMeetings[0].roomCode!.substring(1);

          // Construct Card widget
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 2.0, bottom: 0.0),
            child: SizedBox(
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    labObject.sectionCode!,
                    style: const TextStyle(color: darkGray),
                  ),
                  Text(sectionType),
                  ...days,
                  Text(startTime + ' - ' + endTime),
                  Text(room)
                ],
              ),
            ),
          );
        }
      case 'FI':
        {
          // Accumalate all lecture meetings in section
          final List<MeetingData> finalMeetings = <MeetingData>[];
          for (final SectionData section in data.sections!) {
            if (section.instructionType == 'LE') {
              finalMeetings.addAll(section.additionalMeetings!);
            }
          }

          // Time
          // Checking for classes that start have *** format instead of ****
          correctTimeFormat(finalMeetings[0]);
          const String prefix = '0000-01-01T';
          String startTime = DateFormat.jm()
              .format(DateTime.parse(prefix + finalMeetings[0].startTime!));
          startTime = startTime.toLowerCase().replaceAll(' ', '');
          String endTime = DateFormat.jm()
              .format(DateTime.parse(prefix + finalMeetings[0].endTime!));
          endTime = endTime.toLowerCase().replaceAll(' ', '');

          final String finalDate = DateFormat.MMMMd('en_US')
              .format(DateTime.parse(finalMeetings[0].meetingDate!));

          // Parse building code and room
          final String room = ' ' +
              finalMeetings[0].buildingCode! +
              ' ' +
              finalMeetings[0].roomCode!.substring(1);

          // Construct Card widget
          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 2.0, bottom: 0.0),
              child: SizedBox(
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Text>[
                    const Text(
                      'FINAL',
                      style: TextStyle(color: darkGray),
                    ),
                    Text(finalDate + '  ' + startTime + ' - ' + endTime),
                    Text(room)
                  ],
                ),
              ));
        }
      default:
        return const Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('No data available.'),
          ),
        );
    }
  }

  List<Widget> resetDays() {
    return <Widget>[
      const Text('M', style: TextStyle(color: darkGray)),
      const Text('T', style: TextStyle(color: darkGray)),
      const Text('W', style: TextStyle(color: darkGray)),
      const Text('T', style: TextStyle(color: darkGray)),
      const Text('F', style: TextStyle(color: darkGray))
    ];
  }

  List<Widget> setDays(List<Widget> days, List<MeetingData> meetings) {
    for (final MeetingData meeting in meetings) {
      if (meeting.dayCode == 'MO') {
        days[0] = const Text('M', style: TextStyle(color: ColorSecondary));
      } else if (meeting.dayCode == 'TU') {
        days[1] = const Text('T', style: TextStyle(color: ColorSecondary));
      } else if (meeting.dayCode == 'WE') {
        days[2] = const Text('W', style: TextStyle(color: ColorSecondary));
      } else if (meeting.dayCode == 'TH') {
        days[3] = const Text('T', style: TextStyle(color: ColorSecondary));
      } else if (meeting.dayCode == 'FR') {
        days[4] = const Text('F', style: TextStyle(color: ColorSecondary));
      }
    }
    return days;
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
}
