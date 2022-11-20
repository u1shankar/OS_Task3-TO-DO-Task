import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types, must_be_immutable
class listbox extends StatelessWidget {
  //listbox({super.key, required this.name, required this.status});
  final String name;
  final bool status;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletetask;

  listbox({
    super.key,
    required this.name,
    required this.status,
    required this.onChanged,
    required this.deletetask
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deletetask,
            icon: Icons.delete,
            backgroundColor: Color.fromARGB(255, 197, 127, 34),
            borderRadius: BorderRadius.circular(20),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(15)),
          child: Row(children: [
            Checkbox(
              value: status,
              onChanged: onChanged,
              activeColor: Colors.blue,
            ),
            Text(
              name,
              style: (TextStyle(
                  decoration:
                      status ? TextDecoration.lineThrough : TextDecoration.none,
                  fontFamily: GoogleFonts.pacifico().fontFamily,
                  fontSize: 20)),
            )
          ]),
        ),
      ),
    );
  }
}
