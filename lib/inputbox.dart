// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/buttons.dart';

class Inputbox extends StatelessWidget {
  VoidCallback onsave;
  VoidCallback oncancel;
  final controller;
  Inputbox({super.key,required this.controller, required this.onsave, required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[200],
      content: Container(
        height: 120,
        child: Column(children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Task name",
              hintStyle: GoogleFonts.sacramento(fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyButton(text: "Add", onpressed: onsave),
              const SizedBox(width: 5,),
              MyButton(text: "Cancel", onpressed: oncancel)
            ],
          )
        ]),
      ),
    );
  }
}
