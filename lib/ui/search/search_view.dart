// ignore_for_file: use_key_in_widget_constructors, always_specify_types, cast_nullable_to_non_nullable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';
import 'package:webreg_mobile_flutter/core/providers/schedule_of_classes.dart';
import 'package:webreg_mobile_flutter/core/providers/user.dart';
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
  late TermDropdown termDropdown;
  List<String> dropdownItems = ['SP21', 'FA21', 'WI22', 'SP22'];
  String _dropdownVal = 'SP22';
  bool firstRun = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    classesProvider =
        Provider.of<ScheduleOfClassesProvider>(context, listen: false);
    classesProvider.userDataProvider =
        Provider.of<UserDataProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
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
                              FutureBuilder(
                                future: classesProvider.scheduleOfClassesService
                                    .fetchTerms(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<Object?> response) {
                                  // Only call lambda upon first run to avoid unneccessary network load

                                  if (response.hasData || !firstRun) {
                                    if (firstRun) {
                                      dropdownItems =
                                          response.data as List<String>;
                                      _dropdownVal = dropdownItems[
                                          dropdownItems.length - 1];
                                    }
                                    //Otherwise will use local reference
                                    return DropdownButton<String>(
                                      underline: Container(height: 0),
                                      value: _dropdownVal,
                                      icon: const Icon(Icons.arrow_drop_down,
                                          color: Colors.black, size: 20),
                                      onChanged: (String? newVal) {
                                        setState(() {
                                          firstRun = false;
                                          _dropdownVal = newVal!;
                                        });
                                      },
                                      items: dropdownItems
                                          .map<DropdownMenuItem<String>>(
                                              (String val) {
                                        return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val,
                                                style: const TextStyle(
                                                    color: darkGray,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)));
                                      }).toList(),
                                    );
                                  } else {
                                    return const CircularProgressIndicator();
                                  }
                                },
                              ),
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
                        child:
                            const Icon(Icons.search, size: 20, color: darkGray),
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

  //Body will change based on if search has been completed by the API or not
  Widget body(bool showList) {
    bool validQuery = false;
    String searchBuilder = '';
    final String termCode = _dropdownVal;

    // Will be true when user has clicked into search bar
    if (showList) {
      final List<String> words = searchString.split(' ');

      switch (words.length) {
        // This case is true when looking for course only (e.g. CSE)
        case 1:
          {
            //Verify that subject code could be valid
            if (words[0].length > 4 || words[0].length < 3) {
              validQuery = false;
              break;
            }
            //Attempt to use the single query as a subject code, limit at 10 * #approx entries per course == 100
            validQuery = true;
            searchBuilder =
                'subjectCodes=${words[0]}&termCode=$termCode&limit=100';
          }
          break;
        // This is the case when searching for specific course (e.g. CSE 110)
        case 2:
          {
            final String firstWord = words[0];
            final String secondWord = words[1];
            // Verify that the course and subject code could be valid
            if ((firstWord.length > 4 || firstWord.length < 3) &&
                (secondWord.length > 4 || secondWord.length < 3)) {
              validQuery = false;
              break;
            }
            validQuery = true;
            searchBuilder =
                'subjectCodes=$firstWord&courseCodes=$secondWord&termCode=$termCode&limit=100';
          }
          break;
        default:
          {
            validQuery = false;
          }
      }

      if (!validQuery) {
        return const Center(
            child: Text(
          'Not a valid query. Please type in a valid course or subject code.',
          style: TextStyle(color: darkGray, fontSize: 18),
          textAlign: TextAlign.center,
        ));
      }
      // Will build results list when schedule of classes api has returned
      return FutureBuilder(
        future: classesProvider.fetchClasses(searchBuilder),
        builder: (BuildContext context, AsyncSnapshot<Object?> response) {
          if (response.hasData) {
            return buildResultsList(context);
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
    } else {
      // When user has not clicked into search bar, hint is displayed
      return const Center(
          child: Text(
        'Search by course code\ne.g. ANTH 23',
        style: TextStyle(color: darkGray, fontSize: 18),
        textAlign: TextAlign.center,
      ));
    }
  }

  // Method builds results list once a model of the repsonse has been completed
  Widget buildResultsList(BuildContext context) {
    // List<CourseData> arguments = widget.args;
    // loops through and adds buttons for the user to click on
    /// add content into for loop here
    final ScheduleOfClassesModel model =
        classesProvider.scheduleOfClassesService.classes!;

    // Check for non valid courses
    if (model.courses!.isEmpty) {
      return Column(
        children: const [
          Expanded(
              child: Center(
                  child: Text(
            'Not a valid query. Please type in a valid course or subject code.',
            style: TextStyle(color: darkGray, fontSize: 18),
            textAlign: TextAlign.center,
          )))
        ],
      );
    }
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
              child: Center(child: Text(course.unitsMax.toString()))),

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
          // Go to detail view for a specific course, passing in data model
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
