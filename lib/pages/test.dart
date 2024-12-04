// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

String value = "";
String dropdownValue = "";
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  void select_Date() async {
    await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050),
        initialDate: DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Stack(
          children: [
          Padding(
            padding:  EdgeInsets.fromLTRB(240, 100, 0, 0),
            child: DropdownMenu(
              initialSelection: list.first,
              onSelected: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              dropdownMenuEntries:
                  list.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 100, 240, 0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Date",
                prefixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () {
                setState(() {
                  select_Date();
                });
              },
            ),
          ),
        ]),
      ),
    );
  }
}
