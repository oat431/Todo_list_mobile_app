import 'package:flutter/material.dart';

class TodoText extends StatelessWidget {
  String content;
  TodoText({this.content});
  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
