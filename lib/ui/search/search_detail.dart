import 'dart:html';

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
        children: [coursePrereqs(), courseDetails()],
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

  Column courseDetails() {
    return Column(children: [
      Card(
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              '${data.sections![0].instructors![0].instructorName}',
              style: TextStyle(
                color: ColorSecondary,
              ),
            ),
            Row(children: [
              Text(
                data.sections![0].sectionCode!,
                style: TextStyle(color: darkGray),
              ),
              Text(" LE "),
              Text(" " +
                  data.sections![0].recurringMeetings![0].dayCodeIsis! +
                  "     "),
              Text(" " +
                  data.sections![0].recurringMeetings![0].startTime! +
                  "-"),
              Text(data.sections![0].recurringMeetings![0].endTime! + "    "),
              Text(data.sections![0].recurringMeetings![0].buildingCode! + " "),
              Text(data.sections![0].recurringMeetings![0].roomCode! + " "),
            ]),
            Row(children: [
              Text("Enrolled: ${data.sections![0].enrolledQuantity}       "),
              Text("Capacity: ${data.sections![0].capacityQuantity}"),
            ]),
          ])),
    ]);
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
