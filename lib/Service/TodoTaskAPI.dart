import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_list/Model/TodoTask.dart';

Future<TodoTask> getAllTask(int id) async {
  final response =
      await http.get(Uri.http('52.179.120.20:5039', "/api/todo/$id/allTasks"));

  if (response.statusCode == 200) {
    return TodoTask.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load todo list');
  }
}
