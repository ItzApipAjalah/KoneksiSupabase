import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_config.dart';
import 'pages/todo_list_page.dart';
import 'pages/add_todo_page.dart';
import 'pages/edit_todo_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSupabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListPage(),
    );
  }
}
