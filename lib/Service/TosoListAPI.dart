import 'package:http/http.dart' as http;

class TodoListAPI {
  static final String _baseUrl = '52.179.120.20:5039';

  static final getAlltodoList =
      http.get(Uri.http(_baseUrl, "/api/todo/todolist"));
}
