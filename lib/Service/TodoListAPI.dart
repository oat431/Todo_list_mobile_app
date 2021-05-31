import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_list/Service/API.dart';

class TodoListAPI {
  static Future<bool> addTodoList(
    String owner,
    String description,
    String date,
    String title,
  ) async {
    var res = await http.post(
      Uri.parse('http://${API.baseUrl}/api/todo/todolist'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "owner": owner,
        "description": description,
        "date": date,
        "title": title,
      }),
    );
    return res.statusCode == 200;
  }

  // read
  static Future<http.Response> getAllTodoList(){
    return
      http.get(Uri.http(API.baseUrl, "/api/todo/todolist"));
  }

  // update
  static Future<bool> updateTodoList(
    int todo_no,
    String description,
    String date,
    String title,
  ) async {
    var res = await http.put(
      Uri.parse('http://${API.baseUrl}/api/todo/todolist/$todo_no'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "description": description,
        "date": date,
        "title": title,
      }),
    );
    return res.statusCode == 200;
  }

  // delete
  static Future<bool> deleteTodoList(int todo_no) async {
    var res = await http.delete(
      Uri.parse('http://${API.baseUrl}/api/todo/todolist/$todo_no'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return res.statusCode == 200;
  }
}
