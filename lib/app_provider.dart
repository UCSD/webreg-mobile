import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:webreg_mobile_flutter/core/providers/schedule_of_classes.dart';
import 'package:webreg_mobile_flutter/core/providers/user.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<UserDataProvider>(
    create: (_) {
      var _userDataProvider = UserDataProvider();

      /// try to load any persistent saved data
      /// once loaded from memory get the user's online profile
      _userDataProvider = UserDataProvider();
      return _userDataProvider;
    },
  ),
  ChangeNotifierProxyProvider<UserDataProvider, ScheduleOfClassesProvider>(
      create: (_) {
    return ScheduleOfClassesProvider();
  }, update: (_, UserDataProvider userDataProvider,
          ScheduleOfClassesProvider? scheduleOfClassesProvider) {
    scheduleOfClassesProvider!.userDataProvider = userDataProvider;
    return scheduleOfClassesProvider;
  })
];
