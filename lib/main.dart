import 'package:flutter/material.dart';
import 'package:todo_list/Screen/TodoScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App what do you want",
      theme: ThemeData(
        primaryColor: Colors.purple.shade200,
      ),
      home: TodoScreen(),
    );
  }
}
