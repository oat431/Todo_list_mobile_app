import 'package:flutter/material.dart';

class TodoFAB extends StatelessWidget {
  Function fun;
  TodoFAB({this.fun});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => {fun()},
      child: Icon(Icons.add),
      backgroundColor: Colors.purple.shade200,
    );
  }
}