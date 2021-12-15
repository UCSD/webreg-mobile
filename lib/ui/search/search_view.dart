import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/ui/search/search_bar.dart';
import 'package:webreg_mobile_flutter/core/models/schedule_of_classes.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';
import 'package:webreg_mobile_flutter/core/providers/schedule_of_classes.dart';

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
  Widget build(BuildContext context) {
    Widget _icon = Icon(Icons.search, size: 20, color: darkGray);
    classesProvider = ScheduleOfClassesProvider();
    return Scaffold(
        appBar: AppBar(
            titleSpacing: 0.0,
            centerTitle: true,
            title: Container(
              decoration: new BoxDecoration(
                color: lightGray,
                borderRadius: new BorderRadius.all(Radius.circular(100.0)),
                border: Border.all(width: 1.0, color: Color(0xFF034263)),
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
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
                          onSubmitted: (text) {
                            setState(() {
                              searchString = text;
                              showList = true;
                              //classesProvider.scheduleOfClassesService.fetchClasses('departments=${text.split(' ')[0]}&termCode=WI21&limit=5&courseCodes=${text.split(' ')[1]}');
                            });
                          },
                          autofocus: true,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
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
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  padding: EdgeInsets.symmetric(horizontal: 9),
                  alignment: Alignment.centerLeft,
                  iconSize: 25,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.filter_list, color: Colors.white),
                  padding: EdgeInsets.symmetric(horizontal: 9),
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
        future: classesProvider.scheduleOfClassesService.fetchClasses(
            'departments=${searchString.split(' ')[0]}&termCode=SP21&limit=5&courseCodes=${searchString.split(' ')[1]}'),
        builder: (BuildContext context, AsyncSnapshot<Object?> response) {
          if (response.hasData) {
            return buildResultsList(context);
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
    } else {
      return Center(
          child: Text(
        "Search by course code\ne.g. ANTH 23",
        style: TextStyle(color: darkGray, fontSize: 18),
        textAlign: TextAlign.center,
      ));
    }
  }

  Widget buildResultsList(BuildContext context) {
    // List<CourseData> arguments = widget.args;
    // loops through and adds buttons for the user to click on
    /// add content into for loop here
    // for (CourseData course in arguments) {}
    ScheduleOfClassesModel model =
        classesProvider.scheduleOfClassesService.classes!;
    CourseData course = model.courses![0];
    List<Widget> contentList = [];
    contentList.add(ListTile(
      title: Container(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(course.departmentCode! + " " + course.courseCode!,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)), // TODO
                ],
              ),
              Text(course.courseTitle!) // TODO
            ],
          ))
        ]),
      ),
      onTap: () {
        Navigator.pushNamed(context, RoutePaths.SearchDetail,
            arguments: course);
        // do something
      },
    ));
    // adds SizedBox to have a grey underline for the last item in the list
    //contentList.add(SizedBox());
    ListView contentListView = ListView(
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children:
          ListTile.divideTiles(tiles: contentList, context: context).toList(),
    );
    return Column(
      children: [Expanded(child: contentListView)],
    );
  }
}



// // contains search bar and search results
// class SearchView extends StatefulWidget {
//   @override
//   _SearchViewState createState() => _SearchViewState();
// }

// class _SearchViewState extends State<SearchView> {
//   late ScheduleOfClassesProvider classesProvider;
//   bool openFilters = false;
//   List<bool> selectedFilters = List<bool>.filled(3, false);
//   List<String> filters = [
//     'Show lower division',
//     'Show upper division',
//     'Show gradudate division'
//   ];
//   // Map<String, bool> filters = {'Show lower division': false, 'Show upper division': false, 'Show gradudate division': false};
//   void setOpenFilters() {
//     this.setState(() {
//       openFilters = !openFilters;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     classesProvider = ScheduleOfClassesProvider();

//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight),
//         child: Hero(
//           tag: 'search_bar',
//           child: SearchBar(setOpenFilters),
//         ),
//       ),
//       body: Stack(
//         children: <Widget>[
          // Center(
          //     child: Text(
          //       "Search by course code\ne.g. ANTH 23",
          //       style: TextStyle(color: darkGray, fontSize: 18),
          //       textAlign: TextAlign.center,
          //     )
          // ),
          // FutureBuilder(
          //   future: classesProvider.scheduleOfClassesService.fetchClasses(
          //       'departments=${classesProvider.searchBarController.text.split(' ')[0]}&termCode=SP21&limit=5&courseCodes=${classesProvider.searchBarController.text.split(' ')[1]}'),
          //   builder: (BuildContext context, AsyncSnapshot<Object?> response) {
          //     if (response.hasData) {
          //       return buildResultsList(context);
          //     } else {
          //       return const CircularProgressIndicator();
          //     }
          //   },
          // ),

//           if (openFilters)
//             Positioned(
//                 top: 0,
//                 left: 0,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   padding: EdgeInsets.symmetric(vertical: 10),
//                   height: 120,
//                   decoration: new BoxDecoration(color: ColorPrimary),
//                   child: ListView.builder(
//                       padding: const EdgeInsets.all(8),
//                       itemCount: selectedFilters.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Container(
//                             height: 30,
//                             padding: EdgeInsets.symmetric(horizontal: 35),
//                             // color: Colors.amber[colorCodes[index]],
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: <Widget>[
//                                   Text(filters[index],
//                                       style: const TextStyle(
//                                           color: Colors.white, fontSize: 16)),
//                                   Switch(
//                                     value: selectedFilters[index],
//                                     onChanged: (value) {
//                                       setState(() {
//                                         selectedFilters[index] = value;
//                                       });
//                                     },
//                                     activeTrackColor: Colors.green,
//                                     activeColor: Colors.white,
//                                   ),
//                                 ]));
//                       }),
//                   // ListView(
//                   //   children: <Widget>[
//                   //     ListTile(
//                   //       title: Text('Show lower division', style: TextStyle(color: Colors.white)),
//                   //       // selected: _selectedFilters[0],
//                   //       // onTap: () => _selectedFilters[0] = true,
//                   //     ),
//                   //     ListTile(
//                   //       leading: Icon(Icons.favorite),
//                   //       title: Text('Show upper division'),
//                   //       // selected: _selectedFilters[1],
//                   //       // onTap: () => _selectedFilters[1] = true,
//                   //     ),
//                   //     ListTile(
//                   //       leading: Icon(Icons.favorite),
//                   //       title: Text('Show graduate division'),
//                   //       // selected: _selectedFilters[2],
//                   //       // onTap: () => _selectedFilters[2] = true,
//                   //     ),
//                   //   ]
//                   // )
//                 ))
//           else
//             SizedBox(),
//         ],
//       ),
//     );
//   }

  // Widget buildResultsList(BuildContext context) {
  //   // List<CourseData> arguments = widget.args;
  //   // loops through and adds buttons for the user to click on
  //   /// add content into for loop here
  //   // for (CourseData course in arguments) {}
  //   ScheduleOfClassesModel model =
  //       classesProvider.scheduleOfClassesService.classes!;
  //   CourseData course = model.courses![0];
  //   List<Widget> contentList = [];
  //   contentList.add(ListTile(
  //     title: Container(
  //       child: Row(children: <Widget>[
  //         // units icon
  //         Container(
  //             height: 30,
  //             width: 30,
  //             decoration: new BoxDecoration(
  //               color: lightGray,
  //               shape: BoxShape.circle,
  //             ),
  //             margin: EdgeInsets.only(right: 10),
  //             child: Center(
  //                 child: Text('4' // TODO
  //                     ))),
  //         // course info
  //         Expanded(
  //             child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: <Widget>[
  //                 Text(course.courseCode!,
  //                     style: TextStyle(
  //                         fontSize: 18, fontWeight: FontWeight.bold)), // TODO
  //               ],
  //             ),
  //             Text(course.courseTitle!) // TODO
  //           ],
  //         ))
  //       ]),
  //     ),
  //     onTap: () {
  //       Navigator.pushNamed(context, RoutePaths.SearchDetail,
  //           arguments: course);
  //       // do something
  //     },
  //   ));
  //   // adds SizedBox to have a grey underline for the last item in the list
  //   //contentList.add(SizedBox());
  //   ListView contentListView = ListView(
  //     // physics: NeverScrollableScrollPhysics(),
  //     shrinkWrap: true,
  //     children:
  //         ListTile.divideTiles(tiles: contentList, context: context).toList(),
  //   );
  //   return Column(
  //     children: [Expanded(child: contentListView)],
  //   );
  // }
// }


