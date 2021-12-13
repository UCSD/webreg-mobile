import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';
import 'package:webreg_mobile_flutter/core/providers/schedule_of_classes.dart';

/* This UI page is used to show course offerings/details (prerequisites, sections, finals) 
*  after the user has searched and selected a course.
*/
class SearchDetail extends StatefulWidget {
  const SearchDetail({Key? key}) : super(key: key);

  @override
  _SearchDetailState createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetail> {
  late ScheduleOfClassesProvider classesProvider;
  @override
  Widget build(BuildContext context) {
    classesProvider = ScheduleOfClassesProvider();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Class Details'),
      ),
      body: FutureBuilder(
        future:  classesProvider.scheduleOfClassesService.fetchClasses(
            'departments=CSE&termCode=SP21&limit=5'),
        builder: (context, response){
          if (response.hasData){
            return Text(classesProvider.scheduleOfClassesService.classes!.toJson().toString());

          }else{
            return const CircularProgressIndicator();
          }
        })
    );
  }
}
