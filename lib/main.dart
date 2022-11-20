// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:to_do_app/frame.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MaterialApp(
    home: Todo(),
    debugShowCheckedModeBanner: false,
  ));
}

// ignore: camel_case_types
class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Todolist(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
