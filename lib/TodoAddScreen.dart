import 'package:flutter/material.dart';
import 'TodoService.dart';
import 'Todo.dart';

class TodoAddScreen extends StatefulWidget {
  final Function callFirstPageSetState;
  TodoAddScreen({required this.callFirstPageSetState}) : super();

  @override
  _TodoAddScreenState createState() => _TodoAddScreenState();
}

class _TodoAddScreenState extends State<TodoAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Title is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final newTodo = Todo(
                      id: 0,
                      title: _titleController.text,
                      completed: false,
                    );

                    final createdTodo = await TodoService.createTodo(newTodo);
                    widget.callFirstPageSetState();
                    Navigator.pop(context, createdTodo);
                  }
                },
                child: Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}