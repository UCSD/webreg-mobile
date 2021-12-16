import 'dart:html';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';

/* This UI page is used to show course offerings/details (prerequisites, sections, finals) 
*  after the user has searched and selected a course.
*/
class SearchDetail extends StatelessWidget {
  const SearchDetail({Key? key, required this.data}) : super(key: key);
  final CourseData data;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
              "${data.departmentCode} ${data.courseCode} \n${data.courseTitle}")),
      body: Column(
        children: [coursePrereqs(), courseDetails(data.sections![0])],
      ));

  Card coursePrereqs() {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
            width: double.maxFinite,
            height: 30,
            child: const Center(
                child: Text(
              'Course Prerequisites and Level Restrictions',
              style: TextStyle(
                color: ColorSecondary,
                fontWeight: FontWeight.bold,
              ),
            ))));
  }

  Widget courseDetails(SectionData section) {
    List<MeetingData> meetings = section.recurringMeetings!;
    MeetingData finalMeeting = section.additionalMeetings![0];
    SectionData lectureSection = SectionData();
    SectionData discussionSection = SectionData();
    List<MeetingData> lectureSections = <MeetingData>[];
    List<MeetingData> discussionSections = <MeetingData>[];
    MeetingData finalSection;
    for (SectionData sections in data.sections!) {
      if (sections.instructionType == 'LE') {
        lectureSection = sections;
      }
    }
    for (SectionData sections in data.sections!) {
      if (sections.instructionType == 'DI') {
        discussionSection = sections;
      }
    }

    // Find all lecture sections
    // for (MeetingData section in meetings) {
    //   if (section.meetingType == 'LE') {
    //     lectureSections.add(section);
    //   } else if (section.meetingType == 'DI') {
    //     discussionSections.add(section);
    //   } else if (section.meetingType == 'FI') {
    //     finalSection = section;
    //   }
    // }

    String instructorName = "";
    for (Instructor instructor in section.instructors!) {
      if (instructor.primaryInstructor!) {
        instructorName = instructor.instructorName!;
      }
    }

    // DAY Section
    List<Widget> days = <Widget>[
      const Text('M', style: TextStyle(color: darkGray)),
      const Text('T', style: TextStyle(color: darkGray)),
      const Text('W', style: TextStyle(color: darkGray)),
      const Text('T', style: TextStyle(color: darkGray)),
      const Text('F', style: TextStyle(color: darkGray))
    ];
    for (MeetingData meeting in meetings) {
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

    // String startTime = "";
    // String endTime = "";
    // // Calculate time
    // int start = int.parse(meetings[0].startTime!);
    // if (start > 1200) {
    //   int temp = start - 1200;
    //   startTime = temp.toString().
    // }

    // DateTime startTime = DateFormat.jm().parse(meetings[0].startTime!);
    // DateTime endTime = DateFormat.jm().parse(meetings[0].endTime!);
    Widget lectureCard = Card(
        margin: EdgeInsets.all(2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(instructorName, style: const TextStyle(color: ColorSecondary)),
          Padding(padding: EdgeInsets.all(5)),
          Row(children: [
            Text(section.sectionCode!, style: const TextStyle(color: darkGray)),
            const Padding(padding: EdgeInsets.all(10)),
            const Text('LE'),
            const Padding(padding: EdgeInsets.all(10)),
            ...days,
            const Padding(padding: EdgeInsets.all(10)),
            Text(meetings[0].startTime! + ' - ' + meetings[0].endTime!),
            const Padding(padding: EdgeInsets.all(10)),
            Text(meetings[0].buildingCode!),
            const Padding(padding: EdgeInsets.all(10)),
            Text(meetings[0].roomCode!),
          ]),
        ]));
    days = <Widget>[
      const Text('M', style: TextStyle(color: darkGray)),
      const Text('T', style: TextStyle(color: darkGray)),
      const Text('W', style: TextStyle(color: darkGray)),
      const Text('T', style: TextStyle(color: darkGray)),
      const Text('F', style: TextStyle(color: darkGray))
    ];
    for (MeetingData meeting in meetings) {
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
    Widget discussionCard = Card(
        margin: EdgeInsets.all(2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(children: [
          Text(section.sectionCode!, style: const TextStyle(color: darkGray)),
          const Padding(padding: EdgeInsets.all(10)),
          const Text('DI'),
          const Padding(padding: EdgeInsets.all(10)),
          ...days,
          const Padding(padding: EdgeInsets.all(10)),
          Text(discussionSection.recurringMeetings![0].startTime! +
              ' - ' +
              discussionSection.recurringMeetings![0].endTime!),
          const Padding(padding: EdgeInsets.all(10)),
          Text(discussionSection.recurringMeetings![0].buildingCode!),
          const Padding(padding: EdgeInsets.all(10)),
          Text(discussionSection.recurringMeetings![0].roomCode!),
        ]));

    Widget finalCard = Card(
      margin: EdgeInsets.all(2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          const Text(
            "FINAL",
            style: TextStyle(color: darkGray),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Text(lectureSection.additionalMeetings![0].meetingDate!),
          const Padding(padding: EdgeInsets.all(10)),
          Text(lectureSection.additionalMeetings![0].startTime! +
              ' - ' +
              lectureSection.additionalMeetings![0].endTime!),
          const Padding(padding: EdgeInsets.all(10)),
          Text(lectureSection.additionalMeetings![0].buildingCode!),
          const Padding(padding: EdgeInsets.all(10)),
          Text(lectureSection.additionalMeetings![0].roomCode!),
        ],
      ),
    );
    return Column(
      children: [lectureCard, discussionCard, finalCard],
    );
    // Row(children: [
    //   Text("Enrolled: ${data.sections![0].enrolledQuantity}       "),
    //   Text("Capacity: ${data.sections![0].capacityQuantity}"),
    // ]),

    // return Column(children: []);
    // return Container(
    //   height: 500,
    //   child: ListView(
    //     children: [
    //       Text('Title of class: ${data.courseTitle}'),
    //       Text(
    //           'Instructors name: ${data.sections![0].instructors![0].instructorName}'),
    //       Text(data.toJson().toString())
    //     ],
    //   ),
    // );
  }
}

// Card(
//           margin: EdgeInsets.all(10),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(5.0),
//           ),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Text(
//               '${data.sections![0].instructors![0].instructorName}',
//               style: TextStyle(
//                 color: ColorSecondary,
//               ),
//             ),
//             Row(children: [
//               Text(
//                 data.sections![0].sectionCode!,
//                 style: TextStyle(color: darkGray),
//               ),
//               Text(" LE "),
//               Text(" " +
//                   data.sections![0].recurringMeetings![0].dayCodeIsis! +
//                   "     "),
//               Text(" " +
//                   data.sections![0].recurringMeetings![0].startTime! +
//                   "-"),
//               Text(data.sections![0].recurringMeetings![0].endTime! + "    "),
//               Text(data.sections![0].recurringMeetings![0].buildingCode! + " "),
//               Text(data.sections![0].recurringMeetings![0].roomCode! + " "),
//             ]),
//             Row(children: [
//               Text("Enrolled: ${data.sections![0].enrolledQuantity}       "),
//               Text("Capacity: ${data.sections![0].capacityQuantity}"),
//             ]),
// ]))

// class _SearchDetailState extends State<SearchDetail> {
//   late ScheduleOfClassesProvider classesProvider;
//   @override
//   Widget build(BuildContext context) {
//     classesProvider = ScheduleOfClassesProvider();
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text('Class Details'),
//         ),
//         body: FutureBuilder(
//             future: classesProvider.scheduleOfClassesService
//                 .fetchClasses('departments=CSE&termCode=SP21&limit=5'),
//             builder: (context, response) {
//               if (response.hasData) {
//                 return Text(classesProvider.scheduleOfClassesService.classes!
//                     .toJson()
//                     .toString());
//               } else {
//                 return const CircularProgressIndicator();
//               }
//             }));
//   }
// }
