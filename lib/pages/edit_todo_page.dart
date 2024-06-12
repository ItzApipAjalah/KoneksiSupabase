import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/todo.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  EditTodoPage({required this.todo});

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final SupabaseClient client = Supabase.instance.client;
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;
  late bool isComplete;

  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    description = widget.todo.description;
    isComplete = widget.todo.isComplete;
  }

  Future<void> updateTodo() async {
    await client.from('todos').update({
      'title': title,
      'description': description,
      'is_complete': isComplete,
    }).eq('id', widget.todo.id).execute();

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Todo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: title,
                decoration: InputDecoration(labelText: 'Title'),
                onSaved: (value) {
                  title = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: description,
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) {
                  description = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              CheckboxListTile(
                title: Text('Complete'),
                value: isComplete,
                onChanged: (bool? value) {
                  setState(() {
                    isComplete = value ?? false;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    updateTodo();
                  }
                },
                child: Text('Update Todo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
