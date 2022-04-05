import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:webreg_mobile_flutter/core/providers/schedule_of_classes.dart';
import 'package:webreg_mobile_flutter/core/providers/user.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<UserDataProvider>(
    create: (_) {
      return UserDataProvider();
    },
  ),
  ChangeNotifierProxyProvider<UserDataProvider, ScheduleOfClassesProvider>(
      create: (_) {
    final ScheduleOfClassesProvider scheduleOfClassesProvider =
        ScheduleOfClassesProvider();
    scheduleOfClassesProvider.userDataProvider = UserDataProvider();
    return scheduleOfClassesProvider;
  }, update: (_, UserDataProvider userDataProvider,
          ScheduleOfClassesProvider? scheduleOfClassesProvider) {
    scheduleOfClassesProvider!.userDataProvider = userDataProvider;
    return scheduleOfClassesProvider;
  })
];
