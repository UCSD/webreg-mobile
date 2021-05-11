import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';

class BottomCourseCard extends StatefulWidget {
  @override
  _BottomCourseCardState createState() => _BottomCourseCardState();
}

class _BottomCourseCardState extends State<BottomCourseCard> {
  void onClick(BuildContext context) {
    showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text('This is the modal bottom sheet. Tap anywhere to dismiss.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 24.0
            )
          )
        )
      );
    });
  }

    Widget renderSection() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Row(
            children: <Widget>[
              Text('A00', style: TextStyle(fontSize: 11, color: darkGray)), // TODO
              Text(' LE', style: TextStyle(fontSize: 11, color: darkGray)) // TODO
            ],
          )
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: <Widget>[
              Text('M', style: TextStyle(fontSize: 11, color: ColorPrimary)), // TODO
              Text('T', style: TextStyle(fontSize: 11, color: lightGray)), // TODO
              Text('W', style: TextStyle(fontSize: 11, color: ColorPrimary)), // TODO
              Text('T', style: TextStyle(fontSize: 11, color: lightGray)), // TODO
              Text('F', style: TextStyle(fontSize: 11, color: ColorPrimary)), // TODO
            ],
          )
        ),
        Expanded(
          flex: 5,
          child: Text('3:30p - 4:50p', style: TextStyle(fontSize: 11, color: ColorPrimary)), // TODO
        ),
        Expanded(
          flex: 5,
          child: Text('PCYHN 106', style: TextStyle(fontSize: 11)), // TODO
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('showBottomSheet'),
      onPressed: () { 
        Scaffold.of(context).showBottomSheet<void>(
          (BuildContext context) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // card title
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                        ),
                        color: lightBlue,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        children: <Widget>[
                          // units icon
                          Container(
                            height: 35,
                            width: 35,
                            decoration: new BoxDecoration(
                              color: lightGray,
                              shape: BoxShape.circle,
                            ),
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                '4',// TODO
                                style: TextStyle(fontSize: 18),
                              )
                            )
                          ),
                          // course info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('CSE 12', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), // TODO
                                    GestureDetector(
                                      child: Icon(Icons.close, size: 20, color: darkGray),
                                      onTap: () {
                                        Navigator.pop(context);
                                      }
                                    )
                                  ],
                                ),
                                Text('Basic Data Struct & OO design', style: TextStyle(fontSize: 16)) // TODO
                              ],
                            )
                          )
                        ]
                      )
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        children: <Widget>[
                          // instructor andd section id
                          Container(
                            margin: EdgeInsets.only(top: 4, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Gillespie, Gary N', style: TextStyle(color: ColorPrimary, fontSize: 12)), // TODO
                                Row(
                                  children: <Widget>[
                                    Text('Section ID', style: TextStyle(color: darkGray, fontSize: 12)), // TODO
                                    Text('  983761', style: TextStyle(fontSize: 12)), // TODO
                                  ]
                                )
                              ]
                            ),
                          ),
                          // course sections: di, final
                          renderSection(),
                          renderSection(),
                        ],
                      )
                    )
                  ],
                ),
              ),
            );
          },
        ); 
      },
    );
  }
}


