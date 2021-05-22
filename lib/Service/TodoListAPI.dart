import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_list/Service/API.dart';

class TodoListAPI {
  Future<http.Response> addtodoList(
      String owner, String description, String date, String title) {
    return http.post(
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
  }

  // read
  static final getAlltodoList =
      http.get(Uri.http(API.baseUrl, "/api/todo/todolist"));

  // update
  Future<http.Response> updatetodoList(
      int todo_no, String description, String date, String title) {
    return http.put(
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
  }

  // delete
  Future<http.Response> deletetodoList(int todo_no) {
    final deletetodoList = http.delete(
      Uri.parse('http://${API.baseUrl}/api/todo/todolist/$todo_no'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return deletetodoList;
  }
}
