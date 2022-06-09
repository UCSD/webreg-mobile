// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';

class BottomCourseCard extends StatefulWidget {
  const BottomCourseCard(this.context);
  final BuildContext context;

  @override
  _BottomCourseCardState createState() => _BottomCourseCardState();
}

class _BottomCourseCardState extends State<BottomCourseCard> {
  void onClick(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                  'This is the modal bottom sheet. Tap anywhere to dismiss.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 24.0)));
        });
  }

  Widget renderSection() {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 3,
            child: Row(
              children: const <Widget>[
                Text('A00',
                    style: TextStyle(
                        fontSize: 11,
                        color:
                            darkGray)), // TODO(p8gonzal): Connect with class schedule api or local profile
                Text(' LE',
                    style: TextStyle(
                        fontSize: 11,
                        color:
                            darkGray)) // TODO(p8gonzal): Connect with class schedule api or local profile
              ],
            )),
        Expanded(
            flex: 3,
            child: Row(
              children: const <Widget>[
                Text('M',
                    style: TextStyle(
                        fontSize: 11,
                        color:
                            ColorPrimary)), // TODO(p8gonzal): Connect with class schedule api or local profile
                Text('T',
                    style: TextStyle(
                        fontSize: 11,
                        color:
                            lightGray)), // TODO(p8gonzal): Connect with class schedule api or local profile
                Text('W',
                    style: TextStyle(
                        fontSize: 11,
                        color:
                            ColorPrimary)), // TODO(p8gonzal): Connect with class schedule api or local profile
                Text('T',
                    style: TextStyle(
                        fontSize: 11,
                        color:
                            lightGray)), // TODO(p8gonzal): Connect with class schedule api or local profile
                Text('F',
                    style: TextStyle(
                        fontSize: 11,
                        color:
                            ColorPrimary)), // TODO(p8gonzal): Connect with class schedule api or local profile
              ],
            )),
        const Expanded(
          flex: 5,
          child: Text('3:30p - 4:50p',
              style: TextStyle(
                  fontSize: 11,
                  color:
                      ColorPrimary)), // TODO(p8gonzal): Connect with class schedule api or local profile
        ),
        const Expanded(
          flex: 5,
          child: Text('PCYHN 106',
              style: TextStyle(
                  fontSize:
                      11)), // TODO(p8gonzal): Connect with class schedule api or local profile
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10.0)
        // ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          // border: Border.all(width: 1, color: )
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 2.5,
              offset: const Offset(1, 1),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 2.5,
              offset: const Offset(-1, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // card title
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                  ),
                  color: lightBlue,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(children: <Widget>[
                  // units icon
                  Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                        color: lightGray,
                        shape: BoxShape.circle,
                      ),
                      margin: const EdgeInsets.only(right: 10),
                      child: const Center(
                          child: Text(
                        '4', // TODO(p8gonzal): Once data becomes available, unharcode
                        style: TextStyle(fontSize: 18),
                      ))),
                  // course info
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text('CSE 12',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight
                                      .bold)), // TODO(p8gonzal): Once data becomes available, unharcode
                          GestureDetector(
                              child: const Icon(Icons.close,
                                  size: 20, color: darkGray),
                              onTap: () {
                                Navigator.pop(widget.context);
                              })
                        ],
                      ),
                      const Text('Basic Data Struct & OO design',
                          style: TextStyle(
                              fontSize:
                                  16)) // TODO(p8gonzal): Once data becomes available, unharcode
                    ],
                  ))
                ])),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: <Widget>[
                    // instructor andd section id
                    Container(
                      margin: const EdgeInsets.only(top: 4, bottom: 8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text('Gillespie, Gary N',
                                style: TextStyle(
                                    color: ColorPrimary,
                                    fontSize:
                                        12)), // TODO(p8gonzal): Once data becomes available, unharcode
                            Row(children: const <Widget>[
                              Text('Section ID',
                                  style: TextStyle(
                                      color: darkGray,
                                      fontSize:
                                          12)), // TODO(p8gonzal): Once data becomes available, unharcode
                              Text('  983761',
                                  style: TextStyle(
                                      fontSize:
                                          12)), // TODO(p8gonzal): Once data becomes available, unharcode
                            ])
                          ]),
                    ),
                    // course sections: di, final
                    renderSection(),
                    renderSection(),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
