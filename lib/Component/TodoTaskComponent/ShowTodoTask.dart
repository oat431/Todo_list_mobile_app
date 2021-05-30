import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_list/Model/TodoTask.dart';
import 'package:todo_list/Widget/TodoFAB.dart';
import 'package:todo_list/Widget/TodoTaskTile.dart';
import 'package:todo_list/Service/TodoTaskAPI.dart';
import 'package:todo_list/Component/TodoTaskComponent/AddingTodoTask.dart';

class ShowTodoTask extends StatefulWidget {
  int todo_no;
  ShowTodoTask({this.todo_no});

  @override
  _ShowTodoTaskState createState() => _ShowTodoTaskState();
}

class _ShowTodoTaskState extends State<ShowTodoTask> {
  List<TodoTask> _todoTask;

  final _task = TextEditingController();
  final _description = TextEditingController();

  Future<String> getAllTaskByTodoList() async {
    var response = await TodoTaskAPI.getallTask(widget.todo_no);
    setState(() {
      List res = json.decode(response.body);
      _todoTask = res.map((data) => TodoTask.fromJson(data)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getAllTaskByTodoList();
  }

  Widget notHaveTask() {
    print('not have task');
    return Text("Don't have any task yet please add.");
  }

  Function update(TodoTask item, int index) {
    return () async {
      await TodoTaskAPI.updateTaskStatus(item.todo_no, item.task_no, 1)
          .then((ok) {});
      setState(() {
        _todoTask[index].status = 1;
      });
    };
  }

  Function delete(TodoTask item) {
    return () async {
      await TodoTaskAPI.deletetodoTask(item.todo_no, item.task_no)
          .then((ok) {});
      getAllTaskByTodoList();
    };
  }

  Function add() {
    return () async {
      getAllTaskByTodoList();
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3, bottom: 3),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _todoTask == null ? 0 : _todoTask.length,
              itemBuilder: (context, index) {
                final item = _todoTask[index];
                return Container(
                  child: Card(
                    child: TodoTaskTile(
                      task: item,
                      index: index,
                      delete: delete(item),
                      update: update(item, index),
                    ),
                  ),
                );
              },
            ),
          ),
          TodoFAB(
            hiddenWidget: AddingTodoTask(
              todo_no: widget.todo_no,
              fun: add(),
            ),
          ),
        ],
      ),
    );
  }
}
