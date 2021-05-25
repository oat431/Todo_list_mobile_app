import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:todo_list/Screen/TodoScreen.dart';
import 'package:todo_list/Screen/TodoTaskScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    TodoScreen.tag: (context) => TodoScreen(),
    TodoTaskScreen.tag: (context) => TodoTaskScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Todo App what do you want",
        theme: ThemeData(
          primaryColor: Colors.purple.shade200,
        ),
        home: TodoScreen(),
        routes: routes,
        builder : (BuildContext context, Widget child){
          return FlutterSmartDialog(child: child);
        }
    );
  }
}
