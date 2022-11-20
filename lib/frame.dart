// ignore: duplicate_ignore

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/inputbox.dart';
import 'package:to_do_app/listbox.dart';

// ignore: camel_case_types
class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _Todoliststate();
}

class _Todoliststate extends State<Todolist> {
  final _controller = TextEditingController();
  List tasks = [];
  void checkboxchanged(bool? value, int index) {
    setState(() {
      tasks[index][1] = !tasks[index][1];
    });
  }

  savenewtask() {
    setState(() {
      tasks.add([_controller.text, false]);
      _controller.clear();
    });
    //Navigator.of(context).pop();
  }

  void createnewtask() {
    showDialog(
      context: context,
      builder: (context) {
        return Inputbox(
          controller: _controller,
          onsave: savenewtask,
          oncancel: (() => Navigator.of(context).pop()),
        );
      },
    );
  }
  
  void deletefun(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text(
            "TO DO List",
            style: GoogleFonts.pacifico(fontSize: 20),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createnewtask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: ((context, index) {
            return listbox(
              name: tasks[index][0],
              status: tasks[index][1],
              onChanged: (value) => checkboxchanged(value, index),
              deletetask: (context) => deletefun(index),
            );
          }),
        ));
  }
}
