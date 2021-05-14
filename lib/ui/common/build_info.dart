import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class BuildInfo extends StatefulWidget {
  @override
  _BuildInfoState createState() => _BuildInfoState();
}

class _BuildInfoState extends State<BuildInfo> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    packageName: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  final String buildEnv = "##BUILD_ENV##";

  @override
  Widget build(BuildContext context) {
    try {
      return Container(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          width: double.infinity,
          child: Text(
            'Webreg Mobile ' +
                _packageInfo.version +
                ' (' +
                _packageInfo.buildNumber +
                ')' +
                ((buildEnv == 'PROD' || buildEnv == '##BUILD_ENV##')
                    ? ''
                    : ' ' + buildEnv) +
                ((buildEnv == '##BUILD_ENV##') ? ' QA' : ''),
            style: TextStyle(color: Colors.black.withOpacity(0.5)),
            textAlign: TextAlign.center,
          ));
    } catch (err) {
      print(err);
      return Container();
    }
  }
}
