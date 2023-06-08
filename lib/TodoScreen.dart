import 'package:flutter/material.dart';
import 'TodoAddScreen.dart';
import 'TodoService.dart';
import 'Todo.dart';


class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreen createState() => _TodoListScreen();
}

class _TodoListScreen extends  State<TodoListScreen> {
  late Future<List<Todo>> list;

  @override
  void initState() {
    callSetState();
    super.initState();
  }

  void callSetState() {
    setState(() {
      list = TodoService.getTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body:
      FutureBuilder<List<Todo>>(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final todos = snapshot.data!;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                  trailing: Checkbox(
                    value: todo.completed,
                    onChanged: (value) {
                      // TODO : update todo
                      print('update');
                      TodoService.updateTodo(
                        Todo(
                          id: todo.id,
                          title: todo.title,
                          completed: value!,
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('add');
          // move to page add TodoAddscreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodoAddScreen(callFirstPageSetState : callSetState)),
          );
        },
      ),
    );
  }
}