import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/ui/search/search_placeholder.dart';
import 'package:webreg_mobile_flutter/ui/calendar/calendar.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> with SingleTickerProviderStateMixin {
  var currentTab = [
    Calendar(Colors.yellow),
    Calendar(Colors.red),
    Calendar(Colors.green),
  ];
  int currentIndex = 0;

  static const TextStyle textStyles = TextStyle(fontSize: 16, color: darkGray);
  static const TextStyle activeStyles = TextStyle(
    // decoration: TextDecoration.underline,
    fontWeight: FontWeight.bold,
    color: ColorPrimary,
    fontSize: 16,
  );
  static const List<Widget> _tabs = <Widget>[
    Text(
      'Calendar',
      style: textStyles,
    ),
    Text(
      'List',
      style: textStyles,
    ),
    Text(
      'Finals',
      style: textStyles,
    )
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text("Webreg", style: TextStyle(
        fontWeight: FontWeight.normal,
      )),
      actions: <Widget>[
        SearchPlaceholder()
      ]
    ),
          bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() { currentIndex = index; });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Text("Calendar", style: textStyles),
            activeIcon: Container(
              child: Column(
                children: [
                  Text("Calendar", style: activeStyles),

                ]
              )
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Text("List", style: textStyles),
            activeIcon: Text("List", style: activeStyles),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Text("Finals", style: textStyles),
            activeIcon: Text("Finals", style: activeStyles),
            label: '',
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: vWhite,
      )
   );
 }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       centerTitle: true,
  //       title: Text("Webreg", style: TextStyle(
  //         fontWeight: FontWeight.normal,
  //       )),
  //       actions: <Widget>[
  //         SearchPlaceholder()
  //       ]
  //     ),
  //     body: currentTab[currentIndex],
  //     bottomNavigationBar: BottomNavigationBar(
  //       type: BottomNavigationBarType.fixed,
  //       currentIndex: 0,
  //       onTap: (index) {
  //         setState(() { currentIndex = index; });
  //       },
  //       items: [
  //           BottomNavigationBarItem(
  //               icon:
  //                   Icon(Icons.graphic_eq, color: Color.fromARGB(255, 0, 0, 0)),
  //               label: 'One'),
  //           BottomNavigationBarItem(
  //               icon: Icon(Icons.report_problem,
  //                   color: Color.fromARGB(255, 0, 0, 0)),
  //               label: 'Two'),
  //           BottomNavigationBarItem(
  //               icon: Icon(Icons.work, color: Color.fromARGB(255, 0, 0, 0)),
  //               label: 'Three'),
  //           BottomNavigationBarItem(
  //               icon: Icon(Icons.domain, color: Color.fromARGB(255, 0, 0, 0)),
  //               label: 'Four'),
  //           BottomNavigationBarItem(
  //               icon: Icon(Icons.menu, color: Color.fromARGB(255, 0, 0, 0)),
  //               label: 'Five'),
  //         ],
  // //       items: <BottomNavigationBarItem>[
  // //         BottomNavigationBarItem(
  // //           icon: Text("Calendar", style: textStyles),
  // //           activeIcon: Text("Calendar", style: TextStyle(
  // //             decoration: TextDecoration.underline,
  // //           ),),
  // //         ),
  // //         BottomNavigationBarItem(
  // //           icon: Text("List", style: textStyles),
  // //           activeIcon: Text("List", style: TextStyle(
  // //   decoration: TextDecoration.underline,
  // // ),),
  // //         ),
  // //         BottomNavigationBarItem(
  // //           icon: Text("Finals", style: textStyles),
  // //           activeIcon: Text("Finals", style: TextStyle(
  // //   decoration: TextDecoration.underline,
  // // ),),
  // //         ),
  // //       ],
  //       showSelectedLabels: false,
  //       showUnselectedLabels: false,
  //       selectedItemColor: ColorPrimary,
  //       unselectedItemColor: darkGray,
  //     )
  //   );
  // }
}