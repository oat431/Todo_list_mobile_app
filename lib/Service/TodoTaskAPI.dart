import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_list/Service/API.dart';

class TodoTaskAPI {
  Future<bool> addtodoTask(
    String task,
    String description,
    int todo_no,
  ) async {
    var res = await http.post(
      Uri.parse('http://${API.baseUrl}/api/todo/$todo_no/addTask'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "task": task,
        "description": description,
      }),
    );
    return res.statusCode == 200;
  }

  // read
  static Future<http.Response> getallTask(int todo_no) {
    return http
        .get(Uri.parse('http://${API.baseUrl}/api/todo/$todo_no/allTasks'));
  }

  // update
  static Future<bool> updateTask(
    int todo_no,
    int task_no,
    String description,
    String task,
  ) async {
    var update = await http.put(
      Uri.parse('http://${API.baseUrl}/api/todo/$todo_no/updateTask/$task_no'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "task": task,
        "description": description,
      }),
    );
    return update.statusCode == 200;
  }

  static Future<bool> updateTaskStatus(
    int todo_no,
    int task_no,
    int status,
  ) async {
    var res = await http.put(
      Uri.parse(
          'http://${API.baseUrl}/api/todo/$todo_no/updateStatus/$task_no/$status'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"status": status}),
    );
    return res.statusCode == 200;
  }

  // delete
  static Future<bool> deletetodoTask(int todo_no, int task_no) async {
    final deletetodoList = await http.delete(
      Uri.parse('http://${API.baseUrl}/api/todo/$todo_no/delteTask/$task_no'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return deletetodoList.statusCode == 200;
  }
}
