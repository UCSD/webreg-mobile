import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';
import 'package:webreg_mobile_flutter/core/providers/user.dart';
import 'package:webreg_mobile_flutter/ui/calendar/calendar.dart';
import 'package:webreg_mobile_flutter/ui/list/course_list_view.dart';
import 'package:webreg_mobile_flutter/ui/search/search_placeholder.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>
    with SingleTickerProviderStateMixin {
  UserDataProvider userDataProvider = UserDataProvider();
  List<Widget> currentTab = <Widget>[
    const Calendar(
      'LECT_DISC',
      calendarType: 'LECT_DISC',
    ),
    CourseListView(),         
    // Finals Calendar
    const Calendar('FINALS', calendarType: 'FINALS'),
  ];
  int currentIndex = 0;

  static const TextStyle textStyles = TextStyle(fontSize: 16, color: darkGray);
  static const TextStyle activeStyles = TextStyle(
    fontWeight: FontWeight.bold,
    color: ColorPrimary,
    fontSize: 16,
  );
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    String _token = '';
    final Uri currentUrl = Uri.base;
    final List<String> fragments = currentUrl.fragment.split('&');
    _token = fragments
        .firstWhere((String e) => e.startsWith('access_token='))
        .substring('access_token='.length);
    userDataProvider.setToken = _token;

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Webreg',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                )),
            actions: <Widget>[SearchPlaceholder()]),
        body: currentTab[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Text('Calendar', style: textStyles),
              activeIcon: Column(children: const <Widget>[
                Text('Calendar', style: activeStyles),
              ]),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Text('List', style: textStyles),
              activeIcon: Text('List', style: activeStyles),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Text('Finals', style: textStyles),
              activeIcon: Text('Finals', style: activeStyles),
              label: '',
            ),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: vWhite,
        ));
  }
}
