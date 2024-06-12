import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/todo.dart';
import '../pages/todo_list_page.dart';
import '../pages/add_todo_page.dart';
import '../pages/edit_todo_page.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final SupabaseClient client = Supabase.instance.client;
  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    final response = await client
        .from('todos')
        .select()
        .order('created_at', ascending: false)
        .execute();

    final data = response.data as List;
    setState(() {
      todos = data.map((json) => Todo.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTodoPage()),
              ).then((value) => fetchTodos());
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(todo.title),
            subtitle: Text(todo.description),
            trailing: Checkbox(
              value: todo.isComplete,
              onChanged: (bool? value) {
                // Implement update function here
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditTodoPage(todo: todo)),
              ).then((value) => fetchTodos());
            },
          );
        },
      ),
    );
  }
}
