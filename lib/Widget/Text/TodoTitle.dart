import 'package:flutter/material.dart';

class TodoTitle extends StatelessWidget {
  String title;

  TodoTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
