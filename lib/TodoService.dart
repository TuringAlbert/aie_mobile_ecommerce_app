import 'package:http/http.dart' as http;
import 'Todo.dart';
import 'dart:convert';

class TodoService {
  static const baseUrl = 'http://localhost:3000';
  static const headers = {'Content-Type': 'application/json'};

  // GET /todos
  static Future<List<Todo>> getTodos() async {
    final response = await http.get(Uri.parse('$baseUrl/todos'));

    // HTTP 요청이 성공적으로 완료되었는지 확인합니다.
    if (response.statusCode == 200) {
      // HTTP 응답 결과로부터 JSON 리스트를 파싱하여 Todo 리스트로 변환합니다.
      final jsonList = jsonDecode(response.body) as List;
      return jsonList.map((json) => Todo.fromJson(json)).toList();
    } else {
      // HTTP 요청이 실패한 경우 예외를 던집니다.
      throw Exception('Failed to load todos');
    }
  }

  // POST /todos
  static Future<Todo> createTodo(Todo todo) async {
    // Todo 객체를 JSON 형식으로 변환합니다.
    final jsonBody = jsonEncode(todo.toJson());

    // HTTP POST 요청을 보내서 새로운 Todo 항목을 생성합니다.
    final response = await http.post(
      Uri.parse('$baseUrl/todos'),
      headers: headers,
      body: jsonBody,
    );

    // HTTP 요청이 성공적으로 완료되었는지 확인합니다.
    if (response.statusCode == 201) {
      // HTTP 응답 결과로부터 생성된 Todo 객체를 파싱하여 반환합니다.
      final json = jsonDecode(response.body);
      return Todo.fromJson(json);
    } else {
      // HTTP 요청이 실패한 경우 예외를 던집니다.
      throw Exception('Failed to create todo');
    }
  }

  // PUT /todos/:id
  static Future<Todo> updateTodo(Todo todo) async {
    // Todo 객체를 JSON 형식으로 변환합니다.
    final jsonBody = jsonEncode(todo.toJson());

    // HTTP PUT 요청을 보내서 Todo 항목을 수정합니다.
    final response = await http.put(
      Uri.parse('$baseUrl/todos/${todo.id}'),
      headers: headers,
      body: jsonBody,
    );

    // HTTP 요청이 성공적으로 완료되었는지 확인합니다.
    if (response.statusCode == 200) {
      // HTTP 응답 결과로부터 수정된 Todo 객체를 파싱하여 반환합니다.
      final json = jsonDecode(response.body);
      return Todo.fromJson(json);
    } else {
      // HTTP 요청이 실패한 경우 예외를 던집니다.
      throw Exception('Failed to update todo');
    }
  }

  // DELETE /todos/:id
  static Future<void> deleteTodo(int id) async {
    // HTTP DELETE 요청을 보내서 Todo 항목을 삭제합니다.
    final response = await http.delete(Uri.parse('$baseUrl/todos/$id'));

    // HTTP 요청이 성공적으로 완료되었는지 확인합니다.
    if (response.statusCode != 204) {
      // HTTP 요청이 실패한 경우 예외를 던집니다.
      throw Exception('Failed to delete todo');
    }
  }
}