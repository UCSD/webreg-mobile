import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  Calendar(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(color: this.color);
  }
}