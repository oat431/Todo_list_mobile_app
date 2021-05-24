import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_list/Service/API.dart';

class TodoTaskAPI {
  Future<http.Response> addtodoTask(
      String task, String description, int todo_no) {
    return http.post(
      Uri.parse('http://${API.baseUrl}/api/todo/$todo_no/addTask'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "task": task,
        "description": description,
      }),
    );
  }

  // read
  static Future<http.Response> getallTask(int todo_no) {
    return http
        .get(Uri.parse('http://${API.baseUrl}/api/todo/$todo_no/allTasks'));
  }

  // update
  Future<http.Response> updateTask(
      int todo_no, int task_no, String description, String task) {
    return http.put(
      Uri.parse('http://${API.baseUrl}/api/todo/$todo_no/updateTask/$task_no'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "task": task,
        "description": description,
      }),
    );
  }

  static Future<bool> updateTaskStatus(int todo_no, int task_no, int status) async {
    var res = await http.put(
      Uri.parse(
          'http://${API.baseUrl}/api/todo/$todo_no/updateStatus/$task_no/$status'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"status": status}),
    );
    if(res.statusCode == 200){
      return true;
    }else {
      return false;
    }
  }

  // delete
  Future<http.Response> deletetodoList(int todo_no, int task_no) {
    final deletetodoList = http.delete(
      Uri.parse('http://${API.baseUrl}/api/todo/$todo_no/delteTask/$task_no'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return deletetodoList;
  }
}
