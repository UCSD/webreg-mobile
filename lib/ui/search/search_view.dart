// ignore_for_file: use_key_in_widget_constructors, always_specify_types

import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';
import 'package:webreg_mobile_flutter/core/providers/schedule_of_classes.dart';
import 'package:webreg_mobile_flutter/ui/search/search_bar.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late Future<List<CourseData>> classes;
  late String searchString;
  late ScheduleOfClassesProvider classesProvider;
  bool showList = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    classesProvider = ScheduleOfClassesProvider();

  }

  @override
  Widget build(BuildContext context) {
    const Widget _icon = Icon(Icons.search, size: 20, color: darkGray);
    return Scaffold(
        appBar: AppBar(
            titleSpacing: 0.0,
            centerTitle: true,
            title: Container(
              decoration: BoxDecoration(
                color: lightGray,
                borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                border: Border.all(width: 1.0, color: const Color(0xFF034263)),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
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
                          onSubmitted: (String text) {
                            setState(() {
                              searchString = text;
                              showList = true;
                            });
                          },
                          autofocus: true,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(fontSize: 16),
                          decoration: const InputDecoration(
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
                  )),
            ),
            automaticallyImplyLeading: false,
            leading: Center(
              child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  alignment: Alignment.centerLeft,
                  iconSize: 25,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.filter_list, color: Colors.white),
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  alignment: Alignment.centerLeft,
                  iconSize: 25,
                  onPressed: () {} //this.setOpenFilters,
                  ),
            ]),
        body: body(showList));
  }

  Widget body(bool showList) {
    if (showList) {
      return FutureBuilder(
        future: classesProvider.fetchClasses(
            'subjectCodes=${searchString.split(' ')[0]}&termCode=SP22'),
        builder: (BuildContext context, AsyncSnapshot<Object?> response) {
          if (response.hasData) {
            return buildResultsList(context);
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
    } else {
      return const Center(
          child: Text(
        'Search by course code\ne.g. ANTH 23',
        style: TextStyle(color: darkGray, fontSize: 18),
        textAlign: TextAlign.center,
      ));
    }
  }

  Widget buildResultsList(BuildContext context) {
    // List<CourseData> arguments = widget.args;
    // loops through and adds buttons for the user to click on
    /// add content into for loop here
    final ScheduleOfClassesModel model =
        classesProvider.scheduleOfClassesService.classes!;
    final List<Widget> contentList = [];
    for (final CourseData course in model.courses!) {
      contentList.add(ListTile(
        title: Row(children: <Widget>[
          // units icon
          Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                color: lightGray,
                shape: BoxShape.circle,
              ),
              margin: const EdgeInsets.only(right: 10),
              child: const Center(child: Text('4'))),

          // Course info
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(course.departmentCode! + ' ' + course.courseCode!,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
              Text(course.courseTitle!)
            ],
          ))
        ]),
        onTap: () {
          Navigator.pushNamed(context, RoutePaths.SearchDetail,
              arguments: course);
        },
      ));
    }
    // adds SizedBox to have a grey underline for the last item in the list
    final ListView contentListView = ListView(
      shrinkWrap: true,
      children:
          ListTile.divideTiles(tiles: contentList, context: context).toList(),
    );
    return Column(
      children: [Expanded(child: contentListView)],
    );
  }
}
