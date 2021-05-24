import 'package:flutter/material.dart';

class TodoDate extends StatelessWidget {
  String date;

  TodoDate({this.date});

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w100,
      ),
    );
  }
}
