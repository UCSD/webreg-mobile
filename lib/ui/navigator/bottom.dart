import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webreg_mobile_flutter/core/providers/user.dart';
import 'package:webreg_mobile_flutter/ui/search/search_placeholder.dart';
import 'package:webreg_mobile_flutter/ui/calendar/calendar.dart';
import 'package:webreg_mobile_flutter/ui/list/course_list_view.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>
    with SingleTickerProviderStateMixin {
  UserDataProvider userDataProvider = UserDataProvider();
  var currentTab = [
    Calendar(Colors.blue.shade200),
    CourseListView(),
    Calendar(Colors.green.shade200),
  ];
  int currentIndex = 0;

  static const TextStyle textStyles = TextStyle(fontSize: 16, color: darkGray);
  static const TextStyle activeStyles = TextStyle(
    // decoration: TextDecoration.underline,
    fontWeight: FontWeight.bold,
    color: ColorPrimary,
    fontSize: 16,
  );
  // @override
  // void didChangeDependencies() {
  //   userDataProvider = Provider.of<UserDataProvider>(context);
  // }

  @override
  Widget build(BuildContext context) {
    String _token = '';
    final currentUrl = Uri.base;
    final fragments = currentUrl.fragment.split('&');
    _token = fragments
        .firstWhere((e) => e.startsWith('access_token='))
        .substring('access_token='.length);
    userDataProvider.setToken = _token;

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("Webreg",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                )),
            actions: <Widget>[SearchPlaceholder()]),
        body: currentTab[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Text("Calendar", style: textStyles),
              activeIcon: Container(
                  child: Column(children: [
                Text("Calendar", style: activeStyles),
              ])),
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
        ));
  }
}
